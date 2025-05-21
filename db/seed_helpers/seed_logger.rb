# SeedLogger: Utility methods for colored and styled console output in seeds.

module SeedLogger
  BORDER = "═" * 50

  ANSI = {
    red:     "\e[91m",
    yellow:  "\e[93m",
    orange:  "\e[38;5;208m", # Safe in 256-color terminals
    green:   "\e[92m",
    white:   "\e[97m",
    magenta: "\e[95m",
    bold:    "\e[1m",
    reset:   "\e[0m"
  }

  def log_info(message)
    log_message(message, style: :orange, border_style: :orange)
  end

  def log_success(message)
    log_message(message, style: :green, border_style: :green)
  end

  def log_warning(message)
    log_message(message, style: :red, border_style: :red)
  end

  private

  # Main log printer
  def log_message(message, style:, border_style:, timestamp: true)
    puts styled_border(border_style)
    puts formatted_log_line(message, style, timestamp)
    puts styled_border(border_style)
  end

  # Formats the log line with message and right-aligned timestamp
  def formatted_log_line(message, style, timestamp)
    styled_msg = highlight_numbers(message, style)
    time_str = timestamp ? colorize("[#{Time.now.strftime('%H:%M:%S')}]", style, bold: false) : ""
    spaces = calculate_padding(styled_msg, time_str)
    "#{styled_msg}#{' ' * spaces}#{time_str}"
  end

  # Highlights numbers in magenta, rest in the given style
  def highlight_numbers(message, style)
    segments = message.split(/(\d+)/)
    segments.map! do |seg|
      seg.match?(/\d+/) ? colorize(seg, :magenta, bold: true) : colorize(seg, style, bold: true)
    end
    segments.join + ANSI[:reset]
  end

  # Returns a colored border string
  def styled_border(color)
    colorize(BORDER, color)
  end

  # Applies ANSI color and bold formatting to the text
  def colorize(text, color, bold: false)
    color_code = ANSI[color] || ""
    bold_code = bold ? ANSI[:bold] : ""
    "#{bold_code}#{color_code}#{text}#{ANSI[:reset]}"
  end

  # Strips ANSI codes for accurate length calculation
  def strip_ansi(str)
    str.gsub(/\e\[[\d;]*m/, '')
  end

  # Calculates spaces needed to right-align the timestamp
  def calculate_padding(styled_msg, time_str)
    msg_length = strip_ansi(styled_msg).length
    time_length = strip_ansi(time_str).length
    total_length = BORDER.length
    [ total_length - msg_length - time_length, 1 ].max
  end
end
