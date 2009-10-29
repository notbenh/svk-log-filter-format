package SVK::Log::Filter::Format;
use base qw( SVK::Log::Filter::Output );
       
=head1 NAME

SVK::Log::Filter::Format - Specify a format at runtime.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS



Perhaps a little code snippet.

    use SVK::Log::Filter::Format;

    my $foo = SVK::Log::Filter::Format->new();
    ...

=cut

use Data::Dumper; sub D (@){print Dumper(@_)};
sub setup {
   my ($self) = @_;
   $self->{argument} =~ s/\\t/ __TAB__/ig;
   $self->{argument} =~ s/\\n/ __NEWLINE__/ig;
   $self->{log_format} = [split /\b/, $self->{argument}];
}
       
sub revision {
   my ($self, $args) = @_;

   my $out = join '', map{ $args->{$_} || $args->{props}{'svn:'.$_} || $_ ;
                         } @{$self->{log_format}};

   #$out = join /\\/, split / _SLASH_/, $out;
   $out =~ s/ __TAB__/\t/g;
   $out =~ s/ __NEWLINE__/\n/g;

   print $out;
   
}

=head1 AUTHOR

ben hengst, C<< <notbenh at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-svk-log-filter-format at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=SVK-Log-Filter-Format>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc SVK::Log::Filter::Format


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=SVK-Log-Filter-Format>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/SVK-Log-Filter-Format>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/SVK-Log-Filter-Format>

=item * Search CPAN

L<http://search.cpan.org/dist/SVK-Log-Filter-Format/>

=back


=head1 ACKNOWLEDGEMENTS

Big thanks to CL for SVK, as with out that, this would not be possible.

=head1 COPYRIGHT & LICENSE

Copyright 2009 ben hengst, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1;
