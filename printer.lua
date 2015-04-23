-- SVG printer

layer_max = 1

tool_e = 0
tool_e_restart = 0
layer_counter = 0

function header()
  h = file('header.svg')
  output(h)
end

function footer()
  output(file('footer.svg'))
end

function layer_start(zheight)
   layer_counter = layer_counter + 1
   if (layer_counter <= layer_max) then
      output('<g id="layer' .. f(zheight) .. '">')
      output('<path style="fill:none;stroke:#000000;stroke-width:0.2;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" ')
      output('d="')
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

function move_xy_cmd(x,y,cmd)
   if (layer_counter <= layer_max) then
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
