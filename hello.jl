using ArgParse

function parse_commandline()
  s = ArgParseSettings()

  @add_arg_table s begin
      "--rc"
          help = "exit code"
          arg_type = Int
          default = 0
  end

  return parse_args(s)
end

parsed_args = parse_commandline()
println("Parsed args:", parsed_args)
for (arg,val) in parsed_args
    println("  $arg  =>  $val")
end
print(VERSION)
print("Hello World")
exit(parsed_args["rc"])