# sbill -- split bills between people
This manual corresponds to version 1.0.1 of sbill.

## Installation
sbill is written in Python 3 and has been tested with Python version 3.6.5 on a Ubuntu 18.04 system.

To install sbill, clone the [repository](https://github.com/pille1842/sbill) and enter the directory, then run `make install` (possibly as root).

By default sbill will be installed as `/usr/local/bin/sbill`, but you can override the `/usr/local` prefix by running `make PREFIX=/usr install`.

If you wish to preserve the prefix, but install into a temporary directory, e.g. to make a package of sbill, use the `DESTDIR` variable like so: `make DESTDIR=/tmp/packaging install`.

sbill has no external dependencies.

## Purpose
Let's have a look at a quick example.

Your company consists of three people, each doing some work for your customers: John, Michael and Ben. Your customer, ACME Corp., has a service contract and pays $1500 per month, not including tax. Michael and Ben each do 8 hours of work for ACME a month, set at $75 per hour plus tax.

You send the following bill to ACME:

| Position         | Price    |
| --------         | -----    |
| Service contract | 1,500.00 |
| VAT 19%          | 285.00   |
| Total            | 1,785.00 |

Michael and Ben each get $75 x 8h = $600. The rest of the bill will be paid into the company's common account.

Now, in your accounting software, you have an account for each of your employees. Michael and Ben will each be responsible for $600 plus tax of the total bill. The rest needs to be assigned to the company's common account.

Entering the bill into your accounting program means making three separate book entries: One each for Michael, Ben, and the common account. Each amount must be entered with taxes included.

sbill aids in the calculation of these three amounts. To make book entries for a total of $1,785 with Michael and Ben each getting $600 plus tax, you call sbill with the following arguments:

```shell
sbill 1785 600 600
```

sbill will produce the following output:

```
 0:   714.00
 1:   714.00
 R:   357.00
```

So you enter $714 each into Michael's and Ben's accounts, and the remainder of $357 into the common account. When ACME pays its bill to your bank account, you simply enter the total of $1785, and all accounts will be balanced.

If there is a remainder after subtracting each share plus tax from the total, it is printed with the preceding letter R. If all of the given shares plus tax amount to more than the total, the missing amount is printed with the preceding letter M. If neither happens, nothing will be printed after the shares.

## Synopsis
```
sbill [-h] [-v] [-t taxrate] total share [share ...]
```

## Options
### -h, --help
Print a short usage notice and exit.

### -v, --version
Print the program's version number and exit.

### -t, --taxrate=*taxrate*
Apply the given *taxrate* to each *share*. *taxrate* should be an integer, e.g. 19 to apply a tax of 19 percent. If no taxrate is set via this option or via the environment variable `TAXRATE`, a default of 19 percent is assumed.

## Arguments
### total
This should be the grand total of your bill to ACME, including tax.

### share
Each share should be the net value apportioned to one of your employees. When the taxrate is set to anything but zero, it will be applied to each share.

## Environment
### `TAXRATE`
sbill looks for this environment variable to be used as the taxrate. If its value is not a valid floating-point number, sbill prints an error message and uses the built-in default of 19 percent.

The value of this variable can be overridden with the command-line option `--taxrate`.

## Bugs
Please report any bugs to the [GitHub issue tracker](https://github.com/pille1842/sbill/issues) or via mail to gpg@erixpage.de.

## License
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.

## Author
Copyright (C) 2018 Eric Haberstroh.
