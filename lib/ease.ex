defmodule Ease do
  import :math, only: [pow: 2, cos: 1, pi: 0, sin: 1, sqrt: 1]

  @moduledoc """
  Provides a number of popular easing functions.

  Useful if you're doing animation or some sort of motion.

  See [easings.net](http://easings.net) for nice graphs of each function.
  """

  @type easing_function :: :linear | :ease_in_quad | :ease_out_quad |
                           :ease_in_out_quad | :ease_in_cubic | :ease_out_cubic |
                           :ease_in_out_cubic | :ease_in_quartic |
                           :ease_out_quartic | :ease_in_out_quartic |
                           :ease_in_quintic | :ease_out_quintic |
                           :ease_in_out_quintic | :ease_in_sine | :ease_out_sine |
                           :ease_in_out_sine | :ease_in_expo | :ease_out_expo |
                           :ease_in_out_expo | :ease_in_circular |
                           :ease_out_circular | :ease_in_out_circular

  @doc """
  No easing.

  Constant velocity with no accelleration.

  ## Examples

      iex> Ease.map(1..10, :linear)
      [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
  """
  @spec linear(number, number, number, number) :: number
  def linear(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    change_in_value * current_time / duration + start_value
  end

  @doc """
  Quadratic ease-in.

  Acceleration from zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_quad)
      [1.0, 1.1111111111111112, 1.4444444444444444, 2.0,
       2.7777777777777777, 3.777777777777778, 5.0, 6.444444444444445,
       8.11111111111111, 10.0]
  """
  @spec ease_in_quad(number, number, number, number) :: number
  def ease_in_quad(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    current_time = current_time / duration
    change_in_value * pow(current_time, 2) + start_value
  end

  @doc """
  Quadratic ease-out.

  Decelleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_out_quad)
      [1.0, 0.8888888888888888, 0.5555555555555556, 0.0,
       -0.7777777777777777, -1.7777777777777781, -3.0, -4.444444444444445,
       -6.111111111111111, -8.0]
  """
  @spec ease_out_quad(number, number, number, number) :: number
  def ease_out_quad(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    current_time = current_time / duration
    -change_in_value * pow(current_time, 2) + start_value
  end

  @doc """
  Quadratic ease-in-out.

  Accelleration from zero velocity to half-way, then decelleration to zero velocity.


  ## Examples

      iex> Ease.map(1..10, :ease_in_out_quad)
      [1.0, 1.2222222222222223, 1.8888888888888888, 3.0, 4.555555555555555,
       6.444444444444445, 7.999999999999999, 9.11111111111111,
       9.777777777777779, 10.0]
  """
  @spec ease_in_out_quad(number, number, number, number) :: number
  def ease_in_out_quad(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    current_time = current_time / (duration / 2)
    if (current_time < 1) do
      change_in_value / 2 * pow(current_time, 2) + start_value
    else
      current_time = current_time - 1
      -change_in_value / 2 * (current_time * (current_time - 2) - 1) + start_value
    end
  end

  @doc """
  Cubic ease-in.

  Acceleration from zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_cubic)
      [1.0, 1.0123456790123457, 1.0987654320987654, 1.3333333333333333,
       1.7901234567901234, 2.54320987654321, 3.666666666666666,
       5.234567901234568, 7.320987654320986, 10.0]
  """
  @spec ease_in_cubic(number, number, number, number) :: number
  def ease_in_cubic(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    current_time = current_time / duration
    change_in_value * pow(current_time, 3) + start_value
  end

  @doc """
  Cubic ease-out.

  Decelleration to zero velocity.
  ## Examples

      iex> Ease.map(1..10, :ease_out_cubic)
      [1.0, 3.6790123456790136, 5.765432098765432, 7.333333333333332,
       8.45679012345679, 9.209876543209877, 9.666666666666666,
       9.901234567901234, 9.987654320987655, 10.0]
  """
  @spec ease_out_cubic(number, number, number, number) :: number
  def ease_out_cubic(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    current_time = (current_time / duration - 1)
    change_in_value * (pow(current_time, 3) + 1) + start_value
  end

  @doc """
  Cubic ease-in-out.

  Accelleration from zero velocity to half-way, then decelleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_out_cubic)
      [1.0, 1.0493827160493827, 1.3950617283950617, 2.333333333333333,
       4.160493827160494, 6.839506172839507, 8.666666666666668,
       9.604938271604938, 9.950617283950617, 10.0]
  """
  @spec ease_in_out_cubic(number, number, number, number) :: number
  def ease_in_out_cubic(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    current_time = current_time / (duration / 2)
    if (current_time < 1) do
      change_in_value / 2 * pow(current_time, 3) + start_value
    else
      current_time = current_time - 2
      change_in_value / 2 * (pow(current_time, 3) + 2) + start_value
    end
  end

  @doc """
  Quartic ease-in.

  Acceleration from zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_quartic)
      [1.0, 1.0013717421124828, 1.0219478737997256, 1.1111111111111112,
       1.3511659807956105, 1.8573388203017833, 2.7777777777777777,
       4.293552812071331, 6.6186556927297655, 10.0]
  """
  @spec ease_in_quartic(number, number, number, number) :: number
  def ease_in_quartic(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    current_time = current_time / duration
    change_in_value * pow(current_time, 4) + start_value
  end

  @doc """
  Quartic ease-out.

  Decelleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_out_quartic)
      [1.0, 4.3813443072702345, 6.706447187928669, 8.222222222222221,
       9.142661179698218, 9.64883401920439, 9.88888888888889,
       9.978052126200273, 9.998628257887518, 10.0]
  """
  @spec ease_out_quartic(number, number, number, number) :: number
  def ease_out_quartic(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    current_time = (current_time / duration) - 1
    -change_in_value * (pow(current_time, 4) - 1) + start_value
  end

  @doc """
  Quartic ease-in-out.

  Accelleration from zero velocity to half-way, then decelleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_out_quartic)
      [1.0, 1.010973936899863, 1.1755829903978052, 1.8888888888888888,
       3.8093278463648828, 7.190672153635117, 9.11111111111111,
       9.824417009602195, 9.989026063100138, 10.0]
  """
  @spec ease_in_out_quartic(number, number, number, number) :: number
  def ease_in_out_quartic(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    current_time = current_time / (duration / 2)
    if (current_time < 1) do
      change_in_value / 2 * pow(current_time, 4) + start_value
    else
      current_time = current_time - 2
      -change_in_value / 2 * (pow(current_time, 4) - 2) + start_value
    end
  end

  @doc """
  Quintic ease-in.

  Acceleration from zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_quintic)
      [1.0, 1.000152415790276, 1.004877305288828, 1.037037037037037,
       1.1560737692424934, 1.476299344612102, 2.1851851851851847,
       3.5616521871665907, 5.994360615759791, 10.0]
  """
  @spec ease_in_quintic(number, number, number, number) :: number
  def ease_in_quintic(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    current_time = current_time / duration
    change_in_value * pow(current_time, 5) + start_value
  end

  @doc """
  Quintic ease-out.

  Decelleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_out_quintic)
      [1.0, 5.005639384240209, 7.438347812833409, 8.814814814814813,
       9.523700655387898, 9.843926230757507, 9.962962962962964,
       9.995122694711172, 9.999847584209725, 10.0]
  """
  @spec ease_out_quintic(number, number, number, number) :: number
  def ease_out_quintic(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    current_time = (current_time / duration) - 1
    change_in_value * (pow(current_time, 5) + 1) + start_value
  end

  @doc """
  Quintic ease-in-out.

  Accelleration from zero velocity to half-way, then decelleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_out_quintic)
      [1.0, 1.002438652644414, 1.0780368846212467, 1.5925925925925923,
       3.4971803078798955, 7.502819692120104, 9.407407407407407,
       9.921963115378754, 9.997561347355585, 10.0]
  """
  @spec ease_in_out_quintic(number, number, number, number) :: number
  def ease_in_out_quintic(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    current_time = current_time / (duration / 2)
    if (current_time < 1) do
      change_in_value / 2 * pow(current_time, 5) + start_value
    else
      current_time = current_time - 2
      change_in_value / 2 * (pow(current_time, 5) + 2) + start_value
    end
  end

  @doc """
  Sinusoidal ease-in.

  Acceleration from zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_sine)
      [1.0, 1.1367302228901277, 1.5427664129268237, 2.205771365940052,
       3.105600011929197, 4.214911512821145, 5.499999999999999,
       6.9218187100689805, 8.437166400997626, 10.0]
  """
  @spec ease_in_sine(number, number, number, number) :: number
  def ease_in_sine(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    -change_in_value * cos(current_time / duration * pi() / 2) + change_in_value + start_value
  end

  @doc """
  Sinusoidal ease-out.

  Decelleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_out_sine)
      [1.0, 2.562833599002373, 4.078181289931019, 5.499999999999999,
       6.785088487178854, 7.894399988070802, 8.794228634059948,
       9.457233587073175, 9.863269777109872, 10.0]
  """
  @spec ease_out_sine(number, number, number, number) :: number
  def ease_out_sine(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    change_in_value * sin(current_time / duration * pi() / 2) + start_value
  end

  @doc """
  Sinusoidal ease-in-out.

  Accelleration from zero velocity to half-way, then decelleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_out_sine)
      [1.0, 1.271383206463412, 2.0528000059645986, 3.2499999999999996,
       4.718583200498813, 6.281416799501186, 7.749999999999999,
       8.947199994035401, 9.728616793536588, 10.0]
  """
  @spec ease_in_out_sine(number, number, number, number) :: number
  def ease_in_out_sine(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    -change_in_value / 2 * (cos(pi() * current_time / duration) - 1) + start_value
  end

  @doc """
  Exponential ease-in.

  Acceleration from zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_expo)
      [1.0087890625, 1.0189854250977164, 1.041010786547598,
       1.088588198820733, 1.1913610937745218, 1.4133628259525122,
       1.8929130917321118, 2.928798961419414, 5.166436205292806, 10.0]
  """
  @spec ease_in_expo(number, number, number, number) :: number
  def ease_in_expo(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    change_in_value * pow(2, 10 * (current_time / duration - 1)) + start_value
  end

  @doc """
  Exponential ease-out.

  Decelleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_out_expo)
      [1.0, 5.833563794707193, 8.071201038580586, 9.107086908267888,
       9.586637174047487, 9.808638906225479, 9.911411801179266,
       9.958989213452401, 9.981014574902284, 9.9912109375]
  """
  @spec ease_out_expo(number, number, number, number) :: number
  def ease_out_expo(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    change_in_value * (0 - pow(2, -10 * current_time / duration) + 1) + start_value
  end


  @doc """
  Exponential ease-in-out.

  Accelleration from zero velocity to half-way, then decelleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_out_expo)
      [1.00439453125, 1.0205053932737989, 1.0956805468872608,
       1.4464565458660559, 3.083218102646403, 7.916781897353598,
       9.553543454133944, 9.90431945311274, 9.9794946067262, 9.99560546875]
  """
  @spec ease_in_out_expo(number, number, number, number) :: number
  def ease_in_out_expo(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    current_time = current_time / (duration / 2)
    if (current_time < 1) do
      change_in_value / 2 * pow(2, 10 * (current_time - 1)) + start_value
    else
      current_time = current_time - 1
      change_in_value / 2 * (0 - pow(2, -10 * current_time) + 2) + start_value
    end
  end

  @doc """
  Circular ease-in.

  Acceleration from zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_circular)
      [1.0, 1.0557280900008417, 1.2250356126078779, 1.5147186257614298,
       1.9377422517014504, 2.5166852264521173, 3.291796067500631,
       4.34314575050762, 5.876894374382339, 10.0]
  """
  @spec ease_in_circular(number, number, number, number) :: number
  def ease_in_circular(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    current_time = current_time / duration
    -change_in_value * (sqrt(1 - pow(current_time, 2)) - 1) + start_value
  end

  @doc """
  Circular ease-out.

  Decelleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_out_circular)
      [1.0, 5.1231056256176615, 6.65685424949238, 7.708203932499368,
       8.483314773547882, 9.06225774829855, 9.48528137423857,
       9.774964387392123, 9.94427190999916, 10.0]
  """
  @spec ease_out_circular(number, number, number, number) :: number
  def ease_out_circular(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    current_time = (current_time / duration - 1)
    change_in_value * sqrt(1 - pow(current_time, 2)) + start_value
  end


  @doc """
  Circular ease-in-out.

  Accelleration from zero velocity to half-way, then decelleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_out_circular)
      [1.0, 1.112517806303939, 1.4688711258507252, 2.1458980337503153,
       3.4384471871911697, 7.561552812808831, 8.854101966249683,
       9.531128874149275, 9.88748219369606, 10.0]
  """
  @spec ease_in_out_circular(number, number, number, number) :: number
  def ease_in_out_circular(current_time, start_value, change_in_value, duration)
  when is_number(current_time) and is_number(start_value)
  and is_number(change_in_value) and is_number(duration) do
    current_time = current_time / (duration / 2)
    if (current_time < 1) do
      -change_in_value / 2 * (sqrt(1 - pow(current_time, 2)) - 1) + start_value
    else
      current_time = current_time - 2
      change_in_value / 2 * (sqrt(1 - pow(current_time, 2)) + 1) + start_value
    end
  end

  @doc """
  Map an enumerable into it's eased version.

  This is a pretty useless function, I've implemented it mainly for
  documentation purposes.

  ## Examples

      iex> Ease.map(1..10, :linear)
      [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
  """
  @spec map(Enumerable.t, easing_function) :: Enumerable.t
  def map(enum, fun) do
    start_value     = Enum.at(enum, 0)
    last_value      = Enum.at(enum, -1)
    change_in_value = last_value - start_value
    duration        = change_in_value

    Enum.map(enum, &apply(Ease, fun, [&1 - start_value, start_value, change_in_value, duration]))
  end
end
