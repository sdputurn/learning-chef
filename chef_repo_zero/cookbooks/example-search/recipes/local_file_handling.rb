

node.default['local_file_handling']['name'] = "recipe_attribute"

log "this is an import tant message from local_file handling recipe"
log node['local_file_handling']['name']