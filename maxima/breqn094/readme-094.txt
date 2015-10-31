Version 0.94 of breqn.sty (May 2002) has a small patch to fix a bug that
shows up when (a) flexisym is not explicitly loaded before breqn and (b)
breqn is not loaded with the "mathstyleoff" option.

This version of breqn.sty is not intended to be the official beta
release because group alignment and the darray environment remain
insufficiently addressed.

In version 0.93 (September 2001) I tracked down and eliminated a number
of significant bugs in the single-equation cases.

I also added a mathstyle package (called from flexisym.sty) that
activates ^ and _ to eliminate problems from sub/sup objects that appear
from the user's point of view to be atomic but that from TeX's math atom
point of view are composite. It appears to me that this will become
inevitable at some point down the road and therefore it is better to
start with it now so that some of the compatibility problems with other
packages can begin to be addressed. For starters, after the mathstyle
package is loaded, any subsequently loaded package that uses characters
such as ^^J or ^^M will tend to run into trouble. A mathstyle-aware
package will (a) need to save/restore the catcodes of ^ and _, and (b)
use \mathsub and \mathsup if it has any definitions that require sub or
sup operations. (I have a separate package "pcatcode" in the works that
provides facilities to help with this, since the catcode problem is a
more general problem already in need of a solution for many other
packages, e.g., amsmath (double-quote character); but pcatcode isn't
quite ready for release yet.)

For the time being you will probably want to load flexisym & breqn after
other packages, as much as possible.

What I'm currently using in my test files is along the lines of

  \usepackage[cmbase]{flexisym}
  \usesymbols{msabm}
  \usepackage[debug]{breqn}
  \setkeys{breqn}{compact}

You can turn off the active catcodes of ^ and _ by using a
"mathstyleoff" option:

  \usepackage[mathstyleoff,cmbase]{flexisym}

In breqn094b.zip I have also included a couple of dvi files documenting
to some extent the algorithms that I am trying to implement.

2002-05-29
Michael Downes
mjd@ams.org
