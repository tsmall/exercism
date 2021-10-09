struct Space::Age
  private SECONDS_PER_YEAR_ON_EARTH = 31_557_600

  private EARTH_YEAR_RATIOS = {
    mercury:   0.2408467,
    venus:     0.61519726,
    earth:     1.0,
    mars:      1.8808158,
    jupiter:  11.862615,
    saturn:   29.447498,
    uranus:   84.016846,
    neptune: 164.79132,
  }

  def self.from_seconds(seconds)
    self.new years: (seconds.to_f / SECONDS_PER_YEAR_ON_EARTH)
  end

  private def initialize(@years : Float64)
  end

  {% for planet, earth_year_ratio in EARTH_YEAR_RATIOS %}
    def age_on_{{planet.id}}
      @years / {{earth_year_ratio}}
    end
  {% end %}
end
