from datetime import datetime
from typing import Dict, List

from kitty.boss import get_boss
from kitty.fast_data_types import Screen, add_timer, get_options
from kitty.utils import color_as_int
from kitty.tab_bar import DrawData, ExtraData, Formatter, TabBarData,\
        as_rgb, draw_attributed_string, draw_title

# --------------------------------------------------------------\
# black  |  red     green    blue     magenta  cyan     white   | color
# color0 |  color1  color2   color4   color5   color6   color7  | normal
# color8 |  color9  color10  color12  color13  color14  color15 | bright
# --------------------------------------------------------------/

OPTS = get_options()
ICON_FG = as_rgb(color_as_int(OPTS.color16))
ICON_BG = as_rgb(color_as_int(OPTS.color8))
BAT_TEXT_COLOR = as_rgb(color_as_int(OPTS.color15))
CLOCK_COLOR = as_rgb(color_as_int(OPTS.color15))
DATE_COLOR = as_rgb(color_as_int(OPTS.color8))

TIMER_ID = None
RIGHT_MARGIN = 1
RIGHT_STATUS_LENGTH = -1
REFRESH_TIME = 1
ICON = "  "
UNPLUGGED_ICONS = {10: "", 20: "",
                   30: "", 40: "",
                   50: "", 60: "",
                   70: "", 80: "",
                   90: "", 100: ""}
PLUGGED_ICONS = {1: ""}
UNPLUGGED_COLORS = {15: as_rgb(color_as_int(OPTS.color1)),
                    16: as_rgb(color_as_int(OPTS.color15))}
PLUGGED_COLORS = {15: as_rgb(color_as_int(OPTS.color1)),
                  16: as_rgb(color_as_int(OPTS.color6)),
                  99: as_rgb(color_as_int(OPTS.color6)),
                  100: as_rgb(color_as_int(OPTS.color2))}
SEPARATOR_SYMBOL, SOFT_SEPARATOR_SYMBOL = ("", "")


def _draw_icon(screen: Screen, index: int) -> int:
    """Draws a icon"""
    if index != 1:
        return 0
    fg, bg = screen.cursor.fg, screen.cursor.bg
    screen.cursor.fg = ICON_FG
    screen.cursor.bg = ICON_BG
    screen.draw(ICON)
    screen.cursor.fg, screen.cursor.bg = fg, bg
    screen.cursor.x = len(ICON)
    return screen.cursor.x


def _draw_left_status(draw_data: DrawData, screen: Screen, tab: TabBarData,
                      before: int, max_title_length: int, index: int,
                      is_last: bool, extra_data: ExtraData) -> int:
    """Draws the left hand status"""
    if screen.cursor.x >= screen.columns - RIGHT_STATUS_LENGTH:
        return screen.cursor.x
    tab_bg = screen.cursor.bg
    tab_fg = screen.cursor.fg
    default_bg = as_rgb(int(draw_data.default_bg))
    if extra_data.next_tab:
        next_tab_bg = as_rgb(draw_data.tab_bg(extra_data.next_tab))
        needs_soft_separator = next_tab_bg == tab_bg
    else:
        next_tab_bg = default_bg
        needs_soft_separator = False
    if screen.cursor.x <= len(ICON):
        screen.cursor.x = len(ICON)
    screen.draw(" ")
    screen.cursor.bg = tab_bg
    draw_title(draw_data, screen, tab, index)
    if not needs_soft_separator:
        screen.draw(" ")
        screen.cursor.fg = tab_bg
        screen.cursor.bg = next_tab_bg
        screen.draw(SEPARATOR_SYMBOL)
    else:
        prev_fg = screen.cursor.fg
        if tab_bg == tab_fg:
            screen.cursor.fg = default_bg
        elif tab_bg != default_bg:
            c1 = draw_data.inactive_bg.contrast(draw_data.default_bg)
            c2 = draw_data.inactive_bg.contrast(draw_data.inactive_fg)
            if c1 < c2:
                screen.cursor.fg = default_bg
        screen.draw(" " + SOFT_SEPARATOR_SYMBOL)
        screen.cursor.fg = prev_fg
    end = screen.cursor.x
    return end


def _draw_right_status(screen: Screen, is_last: bool, cells: list) -> int:
    """Draws the right hand status"""
    if not is_last:
        return 0
    draw_attributed_string(Formatter.reset, screen)
    screen.cursor.x = screen.columns - RIGHT_STATUS_LENGTH
    screen.cursor.fg = 0
    for color, status in cells:
        screen.cursor.fg = color
        screen.draw(status)
    screen.cursor.bg = 0
    return screen.cursor.x


def _redraw_tab_bar(_):
    """Redraws the tab bar"""
    tm = get_boss().active_tab_manager
    if tm is not None:
        tm.mark_tab_bar_dirty()


def get_battery_status(icon_or_color: Dict, percent: int) -> str:
    """Gets the status of the battery"""
    return icon_or_color[min(icon_or_color.keys(), key=lambda x: abs(x - percent))]


def get_battery_cells() -> List:
    try:
        with open("/sys/class/power_supply/BAT0/status", "r") as f:
            status = f.read()
        with open("/sys/class/power_supply/BAT0/capacity", "r") as f:
            percent = int(f.read())
        if status == "Discharging\n":
            icon_color = get_battery_status(UNPLUGGED_COLORS, percent)
            icon = get_battery_status(UNPLUGGED_ICONS, percent)
        elif status == "Not charging\n":
            icon_color = get_battery_status(UNPLUGGED_COLORS, percent)
            icon = get_battery_status(PLUGGED_ICONS, percent)
        else:
            icon_color = get_battery_status(PLUGGED_COLORS, percent)
            icon = get_battery_status(PLUGGED_ICONS, percent)
        percent_cell = (BAT_TEXT_COLOR, str(percent) + "% ")
        icon_cell = (icon_color, icon)
        return [percent_cell, icon_cell]
    except FileNotFoundError:
        return []


def draw_tab(draw_data: DrawData, screen: Screen, tab: TabBarData,
             before: int, max_title_length: int, index: int,
             is_last: bool, extra_data: ExtraData) -> int:
    """Draws the tab"""
    global TIMER_ID, RIGHT_STATUS_LENGTH
    if TIMER_ID is None:
        TIMER_ID = add_timer(_redraw_tab_bar, REFRESH_TIME, True)
    clock = datetime.now().strftime(" %H:%M")
    date = datetime.now().strftime(" %d.%m.%Y")
    cells = get_battery_cells()
    cells.append((CLOCK_COLOR, clock))
    cells.append((DATE_COLOR, date))
    RIGHT_STATUS_LENGTH = RIGHT_MARGIN
    for cell in cells:
        RIGHT_STATUS_LENGTH += len(str(cell[1]))

    _draw_icon(screen, index)
    _draw_left_status(draw_data, screen, tab, before,
                      max_title_length, index, is_last, extra_data)
    _draw_right_status(screen, is_last, cells)
    return screen.cursor.x
