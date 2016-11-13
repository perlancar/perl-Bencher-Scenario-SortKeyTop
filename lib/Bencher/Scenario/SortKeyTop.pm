package Bencher::Scenario::SortKeyTop;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark Sort::Key::Top',
    participants => [
        {
            name => 'sort',
            summary => "Perl's sort() builtin",
            code_template=>'state $elems=<elems>; my @sorted = sort { $a <=> $b } @$elems; splice @sorted, 0, <n>',
            result_is_list => 1,
        },
        {
            name => 'Sort::Key::Top',
            fcall_template => 'Sort::Key::Top::nkeytopsort(sub { $_ }, <n>, @{<elems>})',
            result_is_list => 1,
        },
        {
            name => 'Sort::Key::Top::PP',
            fcall_template => 'Sort::Key::Top::PP::nkeytopsort(sub { $_ }, <n>, @{<elems>})',
            result_is_list => 1,
        },
    ],
    datasets => [
        {name=>'elems=10 , n=5'    , args=>{elems=>[reverse 1..10]  , n=>  5}},
        {name=>'elems=100, n=10'   , args=>{elems=>[reverse 1..100] , n=> 10}},
        {name=>'elems=1000, n=10'  , args=>{elems=>[reverse 1..1000], n=> 10}},
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO
