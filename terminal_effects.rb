###########################################################################
# Just a little module to provides some ansi code effects for the terminal
#
# include/extend this module in your class/module and you got the
# following instance/class methods:
#
# blink("Blink")
# bold("Bold")
# italic("Italic")
# faint("Faint")
# conceal("Conceal")
# negative("Negative")
# underline("underline")
# foreground_color("foreground color red normal", :red, :normal)
# foreground_color("foreground color red bright", :red, :bright)
# background_color("background color red normal", :red, :normal)
# background_color("background color red bright", :red, :bright)
#
# Available colors: black, red, green, yellow, blue, megenate, cyan, white
###########################################################################

module TerminalEffects
    
  effect_methods = {
    :bold => 1, :faint => 2, :blink => 5, :italic => 3, :underline => 4,
    :conceal => 8, :negative => 7, :crossed => 9
  }
  
  effect_methods.each_pair do |key,value|
    define_method key do |text|
      "\033[#{value}m#{text}\033[0m"  
    end
  end
  
  def foreground_color(text, color, intensity="normal")
    return "\033[#{colors((30..37).to_a)[color]}m#{text}\033[0m" if intensity == :normal
    return "\033[#{colors((90..97).to_a)[color]}m#{text}\033[0m" if intensity == :bright
  end
  
  def background_color(text, color, intensity="normal")
    return "\033[#{colors((40..47).to_a)[color]}m#{text}\033[0m" if intensity == :normal
    return "\033[#{colors((100..107).to_a)[color]}m#{text}\033[0m" if intensity == :bright      
  end  

  def colors(numbers)
    clrs = {}
    numbers.each_index do |n|
      clrs[:black]   = numbers[n] if n == 0
      clrs[:red]     = numbers[n] if n == 1
      clrs[:green]   = numbers[n] if n == 2
      clrs[:yellow]  = numbers[n] if n == 3
      clrs[:blue]    = numbers[n] if n == 4
      clrs[:megenta] = numbers[n] if n == 5
      clrs[:cyan]    = numbers[n] if n == 6
      clrs[:white]   = numbers[n] if n == 7                                 
    end
    clrs
  end      
end