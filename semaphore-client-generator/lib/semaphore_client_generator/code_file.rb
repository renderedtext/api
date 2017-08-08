class SemaphoreClientGenerator
  class CodeFile
    def initialize(template_path, output_root_path = nil)
      @template_path = template_path
      @output_root_path = output_root_path
    end

    def content(args)
      binding = context(args)

      template.result(binding)
    end

    def generate(relative_path, args)
      path = file_path(relative_path)
      content = content(args)

      File.write(path, content)
    end

    private

    def file_path(relative_path)
      [@output_root_path, relative_path + ".rb"].compact.join("/").tap do |path|
        dir_path = path.split("/").tap(&:pop).join("/")

        FileUtils.mkdir_p(dir_path)
      end
    end

    def context(args)
      OpenStruct.new(args).instance_eval do
        each_pair do |key, value|
          instance_variable_set("@#{key}".to_sym, value)
        end

        binding
      end
    end

    def template
      @template ||= begin
        file = File.read(@template_path)

        ERB.new(file, nil, "-")
      end
    end
  end
end
