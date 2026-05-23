# what modules to run

module "my_network" {
  source = "./modules/network"
}

# Add the new compute module
module "my_compute" {
  source = "./modules/compute"
  
  # Pass the IDs from the network module to the compute module
  public_subnet_id  = module.my_network.public_subnet_id
  private_subnet_id = module.my_network.private_subnet_id
  
  # Pass the Security Guard IDs!
  public_sg_id      = module.my_network.public_sg_id
  private_sg_id     = module.my_network.private_sg_id
}
