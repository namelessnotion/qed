module Respect
module Reporter #:nodoc:

  require 'respect/reporter/base'

  # = Summary Reporter
  #
  # Similar to the Verbatim reporter, but does
  # not display test code for passing tests.
  class Summary < BaseClass

    def report_header(step)
      puts ANSICode.bold("#{step}")
    end

    def report_comment(step)
      txt = step.to_s.tabto(2)
      txt[0,1] = "*"
      puts txt 
    end

    def report_macro(step)
      txt = step.to_s.tabto(2)
      txt[0,1] = "*"
      puts txt 
      #puts
      #puts ANSICode.magenta("#{step}")
    end

    def report_pass(step)
      #puts ANSICode.green("#{step}")
    end

    def report_fail(step, assertion)
      msg = ''
      msg << "  ##### FAIL #####\n"
      msg << "  # " + assertion.to_s
      msg = ANSICode.magenta(msg)
      puts msg
      #puts
      puts ANSICode.red("#{step}")
    end

    def report_error(step, exception)
      raise exception if $DEBUG
      msg = ''
      msg << "  ##### ERROR #####\n"
      msg << "  # " + exception.to_s + "\n"
      msg << "  # " + exception.backtrace[0]
      msg = ANSICode.magenta(msg)
      puts msg
      #puts
      puts ANSICode.red("#{step}")
    end

    #def report(str)
    #  count[-1] += 1 unless count.empty?
    #  str = str.chomp('.') + '.'
    #  str = count.join('.') + ' ' + str
    #  puts str.strip
    #end

  end #class Summary

end#module Reporter
end#module Respect

