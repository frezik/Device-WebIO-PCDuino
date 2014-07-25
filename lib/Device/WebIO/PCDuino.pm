package Device::WebIO::PCDuino;

# ABSTRACT: Device::WebIO implementation for the pcDuino
use v5.12;
use Moo;
use namespace::clean;
use Device::PCDuino ();


sub BUILDARGS
{
    my ($class, $args) = @_;

    $args->{pwm_bit_resolution} = 8;
    $args->{pwm_max_int}        = 2 ** $args->{pwm_bit_resolution};
    $args->{input_pin_count}    = 18;
    $args->{output_pin_count}   = 18;
    $args->{pwm_pin_count}      = 1;
    # TODO
    # 6 bits for ADC 0 and 1, but 12 for the rest
    $args->{adc_bit_resolution} = 12;
    $args->{adc_max_int}        = 2 ** $args->{adc_bit_resolution};
    # TODO
    # 2 Volts for ADC 0 and 1, but 3.3V for the rest
    $args->{adc_volt_ref}       = 3.3;
    $args->{adc_pin_count}      = 6;

    return $args;
}


has 'input_pin_count', is => 'ro';
with 'Device::WebIO::Device::DigitalInput';

sub set_as_input
{
}

sub input_pin
{
}


has 'output_pin_count', is => 'ro';
with 'Device::WebIO::Device::DigitalOutput';

sub set_as_output
{
}

sub output_pin
{
}


has 'pwm_pin_count',      is => 'ro';
has 'pwm_bit_resolution', is => 'ro';
has 'pwm_max_int',        is => 'ro';
with 'Device::WebIO::Device::PWM';

sub pwm_output_int
{
}


has 'adc_max_int',        is => 'ro';
has 'adc_bit_resolution', is => 'ro';
has 'adc_volt_ref',       is => 'ro';
has 'adc_pin_count',      is => 'ro';
with 'Device::WebIO::Device::ADC';

sub adc_input_int
{
}


# TODO
#with 'Device::WebIO::Device::SPI';
#with 'Device::WebIO::Device::I2C';
#with 'Device::WebIO::Device::Serial';
#with 'Device::WebIO::Device::VideoStream';

1;
