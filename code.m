% 3D Object Rendering and Image Formation Using Pinhole Camera Model

clc;
clear;

% Step 1: Define a 3D Object (Cube)
cube_vertices = [-1, -1, -1;
                 -1, -1,  1;
                 -1,  1, -1;
                 -1,  1,  1;
                  1, -1, -1;
                  1, -1,  1;
                  1,  1, -1;
                  1,  1,  1];
              
cube_faces = [1, 2, 6, 5;
              2, 4, 8, 6;
              4, 3, 7, 8;
              3, 1, 5, 7;
              1, 2, 4, 3;
              5, 6, 8, 7];

% Display 3D Cube
figure;
patch('Vertices', cube_vertices, 'Faces', cube_faces, ...
      'FaceColor', 'cyan', 'EdgeColor', 'black', 'FaceAlpha', 0.5);
title('3D Cube');
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
axis equal;
view(3);  % 3D view

% Step 2: Camera Model and Image Projection
focal_length = 1;  % Focal length
camera_position = [0, 0, 0];  % Camera at origin

projected_points = [];
for i = 1:size(cube_vertices, 1)
    X = cube_vertices(i, 1);
    Y = cube_vertices(i, 2);
    Z = cube_vertices(i, 3);
    
    % Pinhole camera projection
    u = (focal_length / Z) * X;
    v = (focal_length / Z) * Y;
    
    projected_points = [projected_points; u, v];
end

% Display 2D Projection
figure;
patch('Vertices', projected_points, 'Faces', cube_faces, ...
      'FaceColor', 'cyan', 'EdgeColor', 'black', 'FaceAlpha', 0.5);
title('2D Projected Cube (Image Plane)');
xlabel('u (Image X)');
ylabel('v (Image Y)');
grid on;
axis equal;

% Step 3: Enhance 3D Cube with Lighting
figure;
patch('Vertices', cube_vertices, 'Faces', cube_faces, ...
      'FaceColor', 'cyan', 'EdgeColor', 'black', 'FaceAlpha', 0.7, ...
      'FaceLighting', 'gouraud', 'AmbientStrength', 0.3);
camlight('headlight');
material('dull');
title('3D Cube with Lighting');
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
axis equal;
view(3);
