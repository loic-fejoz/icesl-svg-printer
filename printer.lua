-- SVG printer

layer_max = 1

tool_e = 0
tool_e_restart = 0
layer_counter = 0
before_header_comment = ''
header_has_been_printed = false

function comment(text)
   local cmt = '<!-- ' .. text .. ' -->'
   if header_has_been_printed then
      output(cmt)
   else
      before_header_comment = before_header_comment .. cmt
   end
end

function header()
  h = file('header.svg')
  output(h)
  header_has_been_printed = true
  output(before_header_comment)
  before_header_comment = ''
end

function footer()
  output(file('footer.svg'))
end

function layer_start(zheight)
   layer_counter = layer_counter + 1
   if (layer_counter <= layer_max) then
      local layer_name = 'layer' .. f(zheight) .. '(' .. layer_counter .. ')'
      local layer_id = 'layer' .. layer_counter
      output('<g id="' .. layer_id  .. '" inkscape:groupmode="layer" inkscape:label="' .. layer_name.. '" >')
   end
end

function layer_stop()
   if (layer_counter <= layer_max) then
      output('" />')
      output('</g>')
   end
end

function retract(tool,e) 
  len   = filament_priming_mm[tool]
  speed = priming_mm_per_sec * 60;
  letter = 'E'
  return e - len
end

function prime(tool,e)
  len   = filament_priming_mm[tool]
  speed = priming_mm_per_sec * 60;
  letter = 'E'
  return e + len
end

current_tool = 0
current_frate = 0

bed_center_x = bed_size_x/2
bed_center_y = bed_size_y/2

function select_tool(tool)
end

function swap_tool(from,to,x,y,z)
end

in_path = false
function move_xy_cmd(x,y,cmd)
   if (layer_counter <= layer_max) then
      if cmd == 'M' then
	 if in_path then
	    output('" />')
	 end
	 output('<path style="fill:none;stroke:#000000;stroke-width:0.2;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" ')
	 output('d="')
	 in_path = true
      end
      output(cmd .. ' ' .. f(x+bed_center_x) .. ',' .. f(y+bed_center_y) .. ' ')
   end
end

function move_xyz(x,y,z)
   move_xy_cmd(x,y,'M')
end

function move_xyze(x,y,z,e)
  tool_e = e
  letter = 'E'
  move_xy_cmd(x,y,'L')
end

function move_e(e)
  tool_e = e
  letter = 'E'
end

function set_feedrate(feedrate)
end

function extruder_start()
end

function extruder_stop()
end

function progress(percent)
end
