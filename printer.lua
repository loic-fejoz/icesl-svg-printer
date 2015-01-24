-- Foldarap

function header()
  h = file('header.svg')
  output(h)
end

function footer()
  output(file('footer.svg'))
end

function layer_start(zheight)
   output('<g id="layer' .. f(zheight) .. '">')
   output('<path style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" ')
   output('d="M ')
end

function layer_stop()
   output('" />')
   output('</g>')  
end

current_tool = 0
current_frate = 0

tool_e = 0
tool_e_restart = 0

bed_center_x = bed_size_x/2
bed_center_y = bed_size_y/2

function select_tool(tool)
end

function swap_tool(from,to,x,y,z)
end

function move_xyz(x,y,z)
   output(' ' .. f(x+bed_center_x) .. ',' .. f(y+bed_center_y) .. ' ')
end

function move_xyze(x,y,z,e)
  tool_e = e
  letter = 'E'
  --  output('G1 X' .. f(x+bed_center_x) .. ' Y' .. f(y+bed_center_y) .. ' Z' .. f(z+z_offset) .. ' F' .. current_frate .. ' ' .. letter .. f(e - tool_e_restart))
  move_xyz(x,y,z)
end

function move_e(e)
  tool_e = e
  letter = 'E'
--  output('G1 ' .. letter .. f(e - tool_e_restart))
end

function set_feedrate(feedrate)
end

function extruder_start()
end

function extruder_stop()
end

function progress(percent)
end
