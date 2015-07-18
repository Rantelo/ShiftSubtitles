@file_name = ARGV[0].to_s
@move_secs = ARGV[1].to_i

def add_sec(arr_t)
	total_secs = arr_t[0] * 3600 + arr_t[1] * 60 + arr_t[2] + @move_secs

	ans = Array.new(3)
	ans[2] = total_secs%60
	total_secs /= 60
	ans[1] = total_secs%60
	total_secs /= 60
	ans[0] = total_secs%60
	return ans
end

def foo(n)
	n.to_s.rjust(2,"0")
end

File.rename(@file_name, "old_"+@file_name)
new_file = File.open(@file_name, "w") 
File.read("old_"+@file_name).each_line do |line|
	if line.match(/^\d\d:[0-5][0-9]:[0-5][0-9],\d\d\d --> \d\d:[0-5][0-9]:[0-5][0-9],\d\d\d\r\n$/)
		start_t = [line[0..1].to_i, line[3..4].to_i, line[6..7].to_i]
		end_t   = [line[17..18].to_i, line[20..21].to_i, line[23..24].to_i]

		s = add_sec start_t
		e = add_sec end_t
		new_file.print "#{foo s[0]}:#{foo s[1]}:#{foo s[2]},#{line[9..11]} --> "
		new_file.print "#{foo e[0]}:#{foo e[1]}:#{foo e[2]},#{line[26..28]}\r\n"
	else
		new_file.puts line
	end
end
new_file.close