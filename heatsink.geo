// A heat sink with equally spaced fins with a given fin_width, aspect ratio and number of fins

fin_width = 0.07;
aspect_ratio = 3;
fin_length = fin_width*aspect_ratio;
gap_ratio = 0.5;
fin_gap = gap_ratio*fin_width;
base_thickness = fin_gap;
n_fins = 8;

// Define Heat sinks bottom. 
x_bottom_left = 0; y_bottom_left = 0; z_bottom_left = 0;
x_bottom_right = (n_fins*fin_width) + ((n_fins-1)*(fin_gap)); y_bottom_right = 0; z_bottom_right = 0;

// Initialize x,y and z co-ordinates of fin

x_fin = 0; y_fin = base_thickness + fin_length; z_fin = 0;

l_c = 0.005; // characterstic length for mesh size

// Iterate over all the points

For i In {0: ((n_fins - 2)*4): 4}
	
	Point(i+1) = {x_fin, y_fin, z_fin, l_c};

	Point(i+2) = {x_fin+fin_width, y_fin, z_fin, l_c};

	Point(i+3) = {x_fin+fin_width, base_thickness, z_fin, l_c};

	Point(i+4) = {x_fin+fin_width+fin_gap, base_thickness, z_fin, l_c};
	
	x_fin = x_fin + fin_width + fin_gap;

EndFor


p1 = newp; Point(p1) = {x_fin, y_fin, z_fin, l_c};
p2 = newp; Point(p2) = {x_fin + fin_width, y_fin, z_fin, l_c};
p3 = newp; Point(p3) = {x_bottom_right, y_bottom_right, z_bottom_right, l_c};
p4 = newp; Point(p4) = {x_bottom_left, y_bottom_left, z_bottom_left, l_c};


For i In {1:(n_fins*4 -1)}
	Line(i) = {i, i+1};
EndFor

l1 = newl; Line(l1) = {p4,1};

Line Loop(1) = {1:(4*n_fins -1), l1};

Plane Surface(1) = {1};

Extrude {0, 0, -0.02}
 {
  Surface{1};
  Layers{1};
  Recombine;
 }

Physical Surface("inlet") = {189};
Physical Surface("frontAndBack") = {194, 1};
Physical Surface("Outlet") = {193, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177, 181, 185};
Physical Volume(195) = {1};
