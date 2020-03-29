TStart = 0;
TFinal = 100000;
mdlWks = get_param('scars_model','ModelWorkspace');
reload(mdlWks)
scars_out = sim('scars_model' ,[TStart TFinal]);

[x, y, z] = sphere;
surf(x*Re,y*Re,z*Re)
axis equal
hold on
plot3(scars_out.pos(:,1),scars_out.pos(:,2),scars_out.pos(:,3),'r','LineWidth',3)
plot3(scars_out.pos(end,1),scars_out.pos(end,2),scars_out.pos(end,3), 'o')
plot3(scars_out.pos1(:,1),scars_out.pos1(:,2),scars_out.pos1(:,3),'g','LineWidth',3)
plot3(scars_out.pos1(end,1),scars_out.pos1(end,2),scars_out.pos1(end,3), 'o')