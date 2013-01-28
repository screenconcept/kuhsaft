module Kuhsaft
  class PartialExtractor

    def extract_filenames(partials)
      partials.each do |partial|
        filename = File.basename(partial).split('.', 0).first
        filename.slice!(0)
        partials << filename
      end
      partials.collect {|d| [I18n.t(d), d]}
    end

    def collect_partials(path)
      extract_filenames(Dir.glob(Rails.root + path))
    end

    def partials(path)
      @partials = collect_partials(path)
    end
  end
end
