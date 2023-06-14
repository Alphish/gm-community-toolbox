/// @desc Explore suites

loader.visit_batch(1, 10.00);

if (loader.is_finished) {
    instance_create_layer(0, 0, layer, ui_VerrificLogView);
    runner = new VerrificLogRunner(root);
}
