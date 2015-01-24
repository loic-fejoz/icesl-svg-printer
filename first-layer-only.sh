int material(vec3 p, int groups) {
    if (groups > 0) {
	   if (p.z <= 0.3) {
		  return groups;
	      }
       }
    return -1;
}
