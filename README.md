# SQL Project fCC: Celestial Bodies Database

## Description:
This is a database of celestial bodies with data provided by **Chat-GPT**. I only do this to revise PSQL and resolve the freeCodeCamp project. Please, don't take this as something important, only entertainment.

![Project's Logo](src/icon.png)

## Tables

### galaxy
| galaxy_id |       name        | type_of_galaxy |                              description                              | distance_light_years | has_spiral_structure | has_elliptical_structure |
|-----------|-------------------|----------------|-----------------------------------------------------------------------|----------------------|----------------------|--------------------------|
|     1     | Milky Way         |     Spiral     | The Milky Way is the galaxy that contains our Solar System.           |        100000        |          t           |            f             |
|     1     | Andromeda         |     Spiral     | The Andromeda Galaxy is the closest spiral galaxy to the Milky Way.   |        2500000       |          t           |            f             |
|     1     | Triangulum Galaxy |     Spiral     | The Triangulum Galaxy is the third-largest galaxy in the Local Group. |        3000000       |          t           |            f             |

### star
| star_id |       name       | spectral_type | luminosity_class | temperature_kelvin | is_binary | is_variable | galaxy_id |
|---------|------------------|---------------|------------------|--------------------|-----------|-------------|-----------|
|    1    | Sun              |       G       |        V         |               5778 |     f     |      f      |     1     |
|    2    | Alpha Centauri A |       G       |        V         |               5790 |     f     |      f      |     1     |
|    3    | Alpha Centauri B |       K       |        V         |               5260 |     f     |      f      |     1     |

### planet
| planet_id |   name  | type_of_planet | diameter_km |   mass_kg    | gravity_ms2 | num_of_moons | age_in_millions_of_years | is_spherical | habitable | star_id |
|-----------|---------|----------------|-------------|--------------|-------------|--------------|--------------------------|--------------|-----------|---------|
|     1     | Mercury |  Terrestrial   |    4880     | 3.30 × 10^23 |     3.7     |       0      |           4600           |      t       | f         |       1 |
|     2     | Venus   |  Terrestrial   |    12104    | 4.87 × 10^24 |     8.87    |       0      |           4600           |      t       | f         |       1 |
|     3     | Earth   |  Terrestrial   |    12742    | 5.97 × 10^24 |     9.81    |       1      |           4600           |      t       | t         |       1 |

### moon
| moon_id |  name  | diameter_km |    mass_kg   |       mass_numeric      | num_of_craters | is_round | has_atmosphere | planet_id |
|---------|--------|-------------|--------------|-------------------------|----------------|----------|----------------|-----------|
|    1    | Luna   |     3474    | 7.35 × 10^22 | 73500000000000000000000 |     500000     |     t    |       f        |     3     |
|    2    | Phobos |     22      | 1.08 × 10^16 | 10800000000000000       |     0          |     f    |       f        |     4     |
|    3    | Deimos |     12      | 2.0 × 10^15  | 2000000000000000        |     0          |     f    |       f        |     4     |

### universe_entity
| universe_entity_id | entity_type |    name    | attribute_name | attribute_value | galaxy_id | moon_id | star_id | planet_id | num_of_craters | is_round | has_atmosphere | num_of_satellites | orbital_period_days |
|--------------------|-------------|------------|----------------|-----------------|-----------|---------|---------|-----------|----------------|----------|----------------|-------------------|---------------------|
|          1         |   galaxy    | Milky Way  |  diameter_ly   | 100000          |     1     |         |         |           |                |          |                |                   |                     |
|          2         |   moon      | Luna       |  diameter_km   | 3474            |           |    1    |         |           |                |          |                |                   |                     |
|          3         |   star      | Sun        |  mass_kg       | 1.989 × 10^30   |           |         |    1    |           |                |          | 

## Consults

### Consult #1
With this consult, we call the tables of the galaxy and star. We will see the relation between them in the **star_id** column.

```SQL
  SELECT * FROM galaxy INNER JOIN star ON galaxy.galaxy_id = star.galaxy_id;
```

### Consult #2
With this consult, we call it a general table with key references to the rest of the tables.

```SQL
  SELECT * FROM universe_entity
```

## Conclusion

This project helped me revise the principle commands of PSQL. Using Chat-GPT, I could save time searching or creating data, and that let me focus on the most important part of the code. With this, we can see the use of Constraints, Primary Keys, and reference keys.
