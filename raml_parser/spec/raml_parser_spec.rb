require "spec_helper"
require "byebug"

RSpec.describe RamlParser do

  it "has a version number" do
    expect(RamlParser::VERSION).not_to be nil
  end

  let(:specs) { RamlParser.load("spec/specs.json") }
  let(:secrets) { specs.find_resource_by_name("secrets") }

  it "can list resource display names" do
    expect(specs.resources.map(&:name)).to match_array [
      "orgs",
      "config_files",
      "env_vars",
      "projects",
      "secrets",
      "teams",
      "users"
    ]
  end

  it "can list resource display names" do
    expect(specs.resources.map(&:display_name)).to match_array [
      "Organizations",
      "Configuration Files",
      "Environment Variables",
      "Projects",
      "Secrets",
      "Teams",
      "Users"
    ]
  end

  it "can list resource stability levels" do
    expect(specs.resources.map(&:stability)).to all(be == "prototype")
  end

  it "can display route display name" do
    expect(secrets.routes.map(&:display_name)).to include("Add a secret to a team")
  end

  it "can display route description" do
    expect(secrets.routes.map(&:description)).to include("The user needs to be a member of the team, and to have admin permissions in the organization.")
  end

  it "can list index routes" do
    expect(secrets.index.map(&:verb_and_path)).to match_array [
      "GET /orgs/{org_username}/secrets",
      "GET /teams/{team_id}/secrets",
      "GET /projects/{project_id}/secrets",
    ]
  end

  it "can list show routes" do
    expect(secrets.show.map(&:verb_and_path)).to match_array [ "GET /secrets/{id}" ]
  end

  it "can list create routes" do
    expect(secrets.create.map(&:verb_and_path)).to match_array [ "POST /orgs/{org_username}/secrets" ]
  end

  it "can list delete routes" do
    expect(secrets.delete.map(&:verb_and_path)).to match_array [ "DELETE /secrets/{id}" ]
  end

  it "can list update routes" do
    expect(secrets.update.map(&:verb_and_path)).to match_array [ "PATCH /secrets/{id}" ]
  end

  it "can list connect routes" do
    expect(secrets.connect.map(&:verb_and_path)).to match_array [
      "POST /teams/{team_id}/secrets/{secret_id}",
      "POST /projects/{project_id}/secrets/{secret_id}"
    ]
  end

  it "can list dissconnect routes" do
    expect(secrets.dissconnect.map(&:verb_and_path)).to match_array [
      "DELETE /teams/{team_id}/secrets/{secret_id}",
      "DELETE /projects/{project_id}/secrets/{secret_id}"
    ]
  end

  it "can create example responses for show" do
    get_shared_config = specs.find_route(:get, "/secrets/{id}")

    expect(get_shared_config.responses.map(&:code)).to match_array([ 200, 404 ])

    expect(get_shared_config.succesfull_response.example).to eq(
      "id" => "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
      "description" => "AWS tokens for deployment",
      "url" => "https://api.semaphoreci.com/v2/secrets/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
      "name" => "AWS Tokens",
      "config_files_url" => "https://api.semaphoreci.com/v2/secrets/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5/config_files",
      "projects_url" => "https://api.semaphoreci.com/v2/secrets/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5/projects",
      "teams_url" => "https://api.semaphoreci.com/v2/secrets/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5/teams",
      "env_vars_url" => "https://api.semaphoreci.com/v2/secrets/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5/env_vars",
      "updated_at" => "2017-06-10 16:59:51 +0200",
      "created_at" => "2017-06-10 16:59:51 +0200"
    )
  end

  it "can create example response for delete" do
    delete_shared_config = specs.find_route(:delete, "/secrets/{id}")

    expect(delete_shared_config.responses.map(&:code)).to match_array([ 204, 404 ])
    expect(delete_shared_config.succesfull_response.example).to eq(nil)
  end

  it "can create example response for index" do
    index = specs.find_route(:get, "/projects/{project_id}/config_files")

    expect(index.responses.map(&:code)).to match_array([ 200, 404 ])

    expect(index.succesfull_response.example).to match_array [
      {
        "id" => "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
        "path"=> ".credentials",
        "url" => "https://api.semaphoreci.com/v2/config_files/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
        "content" => "password: ec2c9f6f64b5",
        "encrypted" => false,
        "shared" => true,
        "updated_at" => "2017-06-10 16:59:51 +0200",
        "created_at" => "2017-06-10 16:59:51 +0200"
      }
    ]
  end

  it "can list request params" do
    patch_properties = specs.find_route(:patch, "/teams/{id}").request.properties

    expect(patch_properties.map(&:name)).to eq ["name", "permission", "description"]

    expect(patch_properties.map(&:description)).to eq [
      "Name of the team. The name must be unique in the organization.",
      "The permission level for team members in the organization.",
      "Description for the team."]

    expect(patch_properties.map(&:type)).to eq ["string", "string", "string"]
    expect(patch_properties.map(&:required?)).to eq [false, false, false]
  end

  it "can handle enum fields" do
    permission = specs.find_route(:patch, "/teams/{id}").request.properties.find { |p| p.name == "permission" }

    expect(permission.type).to eq("string")
    expect(permission).to be_enum
    expect(permission.enum_values).to eq ["read", "edit", "admin"]

    name = specs.find_route(:patch, "/teams/{id}").request.properties.find { |p| p.name == "name" }
    expect(name).to_not be_enum
  end

  it "can display the structure of the response" do
    index_shared_config = specs.find_route(:get, "/projects/{project_id}/secrets")

    expect(index_shared_config.succesfull_response.structure).to eq([
      {
        "id" => "string",
        "description" => "string",
        "url" => "string",
        "name" => "string",
        "updated_at" => "datetime",
        "created_at" => "datetime",
        "projects_url"=>"string",
        "teams_url" => "string",
        "env_vars_url" => "string",
        "config_files_url" => "string",
        "created_at" => "datetime",
        "updated_at" => "datetime"
      }
    ])
  end

end
