module Sluggable
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend ClassMethods
    base.class_eval do 
      class_setup
    end
  end

  module InstanceMethods
    def to_param
      self.slug
    end

    def generate_slug!
      potential_slug = prepare_slug(self.send(self.class.slug_column.to_sym))
      obj = self.class.find_by(slug: potential_slug)
      unique_id_counter = 2
      binding.pry
      while obj && obj != self
        potential_slug = append_suffix(potential_slug, unique_id_counter)
        obj = self.class.find_by(slug: potential_slug)
        unique_id_counter += 1
      end

      self.slug = potential_slug
    end

    def prepare_slug(str)
      str = str.strip
      str.gsub!(/\s*[^a-zA-Z0-9]\s*/, '-')
      str.gsub!(/-+/, '-')
      str.downcase
    end

    def append_suffix(slug, unique_id)
      if slug.split('-').last.to_i != 0
        slug = slug.split('-').slice(0...-1).join('-')
      end

      "#{slug}-#{unique_id}"
    end
  end

  module ClassMethods
    def class_setup
      before_save :generate_slug!
      class_attribute :slug_column
    end

    def sluggable_column(col_name)
      self.slug_column = col_name
    end
  end
end
