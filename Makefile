# This Makefile is for the Elearn extension to perl.
#
# It was generated automatically by MakeMaker version
# 6.55_02 (Revision: 65502) from the contents of
# Makefile.PL. Don't edit this file, edit Makefile.PL instead.
#
#       ANY CHANGES MADE HERE WILL BE LOST!
#
#   MakeMaker ARGV: ()
#

#   MakeMaker Parameters:

#     ABSTRACT => q[Catalyst based application]
#     AUTHOR => q[Alvin,,,]
#     BUILD_REQUIRES => {  }
#     DIR => []
#     DISTNAME => q[Elearn]
#     EXE_FILES => [q[script/elearn_cgi.pl], q[script/elearn_create.pl], q[script/elearn_fastcgi.pl], q[script/elearn_server.pl], q[script/elearn_test.pl]]
#     NAME => q[Elearn]
#     NO_META => q[1]
#     PL_FILES => {  }
#     PREREQ_PM => { Gtk2::Notify=>q[0], Catalyst::Plugin::ConfigLoader=>q[0], YAML::XS=>q[0], List::Util=>q[0], Config::General=>q[0], Moose=>q[0], File::Copy=>q[0], namespace::autoclean=>q[0], Catalyst::Plugin::Static::Simple=>q[0], File::HomeDir=>q[0], ExtUtils::MakeMaker=>q[6.42], WWW::Mechanize=>q[0], Catalyst::Action::RenderView=>q[0], File::Basename=>q[0], JSON=>q[0], Catalyst::Runtime=>q[5.80022] }
#     VERSION => q[0.01]
#     dist => { PREOP=>q[$(PERL) -I. "-MModule::Install::Admin" -e "dist_preop(q($(DISTVNAME)))"] }
#     realclean => { FILES=>q[MYMETA.yml] }
#     test => { TESTS=>q[t/01app.t t/02pod.t t/03podcoverage.t t/controller_admin.t t/controller_courses.t t/controller_createLecture.t t/controller_documentCode.t t/controller_E_learning-Test.t t/controller_help.t t/controller_questions.t t/controller_search.t t/controller_userData.t t/model_ElearnDB.t] }

# --- MakeMaker post_initialize section:


# --- MakeMaker const_config section:

# These definitions are from config.sh (via /usr/lib/perl/5.10/Config.pm).
# They may have been overridden via Makefile.PL or on the command line.
AR = ar
CC = cc
CCCDLFLAGS = -fPIC
CCDLFLAGS = -Wl,-E
DLEXT = so
DLSRC = dl_dlopen.xs
EXE_EXT = 
FULL_AR = /usr/bin/ar
LD = cc
LDDLFLAGS = -shared -O2 -g -L/usr/local/lib -fstack-protector
LDFLAGS =  -fstack-protector -L/usr/local/lib
LIBC = /lib/libc-2.11.1.so
LIB_EXT = .a
OBJ_EXT = .o
OSNAME = linux
OSVERS = 2.6.24-27-server
RANLIB = :
SITELIBEXP = /usr/local/share/perl/5.10.1
SITEARCHEXP = /usr/local/lib/perl/5.10.1
SO = so
VENDORARCHEXP = /usr/lib/perl5
VENDORLIBEXP = /usr/share/perl5


# --- MakeMaker constants section:
AR_STATIC_ARGS = cr
DIRFILESEP = /
DFSEP = $(DIRFILESEP)
NAME = Elearn
NAME_SYM = Elearn
VERSION = 0.01
VERSION_MACRO = VERSION
VERSION_SYM = 0_01
DEFINE_VERSION = -D$(VERSION_MACRO)=\"$(VERSION)\"
XS_VERSION = 0.01
XS_VERSION_MACRO = XS_VERSION
XS_DEFINE_VERSION = -D$(XS_VERSION_MACRO)=\"$(XS_VERSION)\"
INST_ARCHLIB = blib/arch
INST_SCRIPT = blib/script
INST_BIN = blib/bin
INST_LIB = blib/lib
INST_MAN1DIR = blib/man1
INST_MAN3DIR = blib/man3
MAN1EXT = 1p
MAN3EXT = 3pm
INSTALLDIRS = site
DESTDIR = 
PREFIX = /usr
PERLPREFIX = $(PREFIX)
SITEPREFIX = $(PREFIX)/local
VENDORPREFIX = $(PREFIX)
INSTALLPRIVLIB = $(PERLPREFIX)/share/perl/5.10
DESTINSTALLPRIVLIB = $(DESTDIR)$(INSTALLPRIVLIB)
INSTALLSITELIB = $(SITEPREFIX)/share/perl/5.10.1
DESTINSTALLSITELIB = $(DESTDIR)$(INSTALLSITELIB)
INSTALLVENDORLIB = $(VENDORPREFIX)/share/perl5
DESTINSTALLVENDORLIB = $(DESTDIR)$(INSTALLVENDORLIB)
INSTALLARCHLIB = $(PERLPREFIX)/lib/perl/5.10
DESTINSTALLARCHLIB = $(DESTDIR)$(INSTALLARCHLIB)
INSTALLSITEARCH = $(SITEPREFIX)/lib/perl/5.10.1
DESTINSTALLSITEARCH = $(DESTDIR)$(INSTALLSITEARCH)
INSTALLVENDORARCH = $(VENDORPREFIX)/lib/perl5
DESTINSTALLVENDORARCH = $(DESTDIR)$(INSTALLVENDORARCH)
INSTALLBIN = $(PERLPREFIX)/bin
DESTINSTALLBIN = $(DESTDIR)$(INSTALLBIN)
INSTALLSITEBIN = $(SITEPREFIX)/bin
DESTINSTALLSITEBIN = $(DESTDIR)$(INSTALLSITEBIN)
INSTALLVENDORBIN = $(VENDORPREFIX)/bin
DESTINSTALLVENDORBIN = $(DESTDIR)$(INSTALLVENDORBIN)
INSTALLSCRIPT = $(PERLPREFIX)/bin
DESTINSTALLSCRIPT = $(DESTDIR)$(INSTALLSCRIPT)
INSTALLSITESCRIPT = $(SITEPREFIX)/bin
DESTINSTALLSITESCRIPT = $(DESTDIR)$(INSTALLSITESCRIPT)
INSTALLVENDORSCRIPT = $(VENDORPREFIX)/bin
DESTINSTALLVENDORSCRIPT = $(DESTDIR)$(INSTALLVENDORSCRIPT)
INSTALLMAN1DIR = $(PERLPREFIX)/share/man/man1
DESTINSTALLMAN1DIR = $(DESTDIR)$(INSTALLMAN1DIR)
INSTALLSITEMAN1DIR = $(SITEPREFIX)/man/man1
DESTINSTALLSITEMAN1DIR = $(DESTDIR)$(INSTALLSITEMAN1DIR)
INSTALLVENDORMAN1DIR = $(VENDORPREFIX)/share/man/man1
DESTINSTALLVENDORMAN1DIR = $(DESTDIR)$(INSTALLVENDORMAN1DIR)
INSTALLMAN3DIR = $(PERLPREFIX)/share/man/man3
DESTINSTALLMAN3DIR = $(DESTDIR)$(INSTALLMAN3DIR)
INSTALLSITEMAN3DIR = $(SITEPREFIX)/man/man3
DESTINSTALLSITEMAN3DIR = $(DESTDIR)$(INSTALLSITEMAN3DIR)
INSTALLVENDORMAN3DIR = $(VENDORPREFIX)/share/man/man3
DESTINSTALLVENDORMAN3DIR = $(DESTDIR)$(INSTALLVENDORMAN3DIR)
PERL_LIB =
PERL_ARCHLIB = /usr/lib/perl/5.10
LIBPERL_A = libperl.a
FIRST_MAKEFILE = Makefile
MAKEFILE_OLD = Makefile.old
MAKE_APERL_FILE = Makefile.aperl
PERLMAINCC = $(CC)
PERL_INC = /usr/lib/perl/5.10/CORE
PERL = /usr/bin/perl "-Iinc"
FULLPERL = /usr/bin/perl "-Iinc"
ABSPERL = $(PERL)
PERLRUN = $(PERL)
FULLPERLRUN = $(FULLPERL)
ABSPERLRUN = $(ABSPERL)
PERLRUNINST = $(PERLRUN) "-I$(INST_ARCHLIB)" "-Iinc" "-I$(INST_LIB)"
FULLPERLRUNINST = $(FULLPERLRUN) "-I$(INST_ARCHLIB)" "-Iinc" "-I$(INST_LIB)"
ABSPERLRUNINST = $(ABSPERLRUN) "-I$(INST_ARCHLIB)" "-Iinc" "-I$(INST_LIB)"
PERL_CORE = 0
PERM_DIR = 755
PERM_RW = 644
PERM_RWX = 755

MAKEMAKER   = /usr/share/perl/5.10/ExtUtils/MakeMaker.pm
MM_VERSION  = 6.55_02
MM_REVISION = 65502

# FULLEXT = Pathname for extension directory (eg Foo/Bar/Oracle).
# BASEEXT = Basename part of FULLEXT. May be just equal FULLEXT. (eg Oracle)
# PARENT_NAME = NAME without BASEEXT and no trailing :: (eg Foo::Bar)
# DLBASE  = Basename part of dynamic library. May be just equal BASEEXT.
MAKE = make
FULLEXT = Elearn
BASEEXT = Elearn
PARENT_NAME = 
DLBASE = $(BASEEXT)
VERSION_FROM = 
OBJECT = 
LDFROM = $(OBJECT)
LINKTYPE = dynamic
BOOTDEP = 

# Handy lists of source code files:
XS_FILES = 
C_FILES  = 
O_FILES  = 
H_FILES  = 
MAN1PODS = script/elearn_cgi.pl \
	script/elearn_create.pl \
	script/elearn_fastcgi.pl \
	script/elearn_server.pl \
	script/elearn_test.pl
MAN3PODS = lib/Elearn.pm \
	lib/Elearn/Controller/E_learning/Root.pm \
	lib/Elearn/Controller/E_learning/admin.pm \
	lib/Elearn/Controller/E_learning/courses.pm \
	lib/Elearn/Controller/E_learning/createLecture.pm \
	lib/Elearn/Controller/E_learning/documentCode.pm \
	lib/Elearn/Controller/E_learning/help.pm \
	lib/Elearn/Controller/E_learning/questions.pm \
	lib/Elearn/Controller/E_learning/search.pm \
	lib/Elearn/Controller/E_learning/upload.pm \
	lib/Elearn/Controller/E_learning/userData.pm \
	lib/Elearn/Controller/E_learning/watch.pm \
	lib/Elearn/Model/E_learning/ElearnDB.pm \
	lib/Elearn/View/E_learning/E_LearningTT.pm

# Where is the Config information that we are using/depend on
CONFIGDEP = $(PERL_ARCHLIB)$(DFSEP)Config.pm $(PERL_INC)$(DFSEP)config.h

# Where to build things
INST_LIBDIR      = $(INST_LIB)
INST_ARCHLIBDIR  = $(INST_ARCHLIB)

INST_AUTODIR     = $(INST_LIB)/auto/$(FULLEXT)
INST_ARCHAUTODIR = $(INST_ARCHLIB)/auto/$(FULLEXT)

INST_STATIC      = 
INST_DYNAMIC     = 
INST_BOOT        = 

# Extra linker info
EXPORT_LIST        = 
PERL_ARCHIVE       = 
PERL_ARCHIVE_AFTER = 


TO_INST_PM = lib/Elearn.pm \
	lib/Elearn.pm.bak \
	lib/Elearn/Controller/E_learning/Root.pm \
	lib/Elearn/Controller/E_learning/admin.pm \
	lib/Elearn/Controller/E_learning/courses.pm \
	lib/Elearn/Controller/E_learning/createLecture.pm \
	lib/Elearn/Controller/E_learning/documentCode.pm \
	lib/Elearn/Controller/E_learning/help.pm \
	lib/Elearn/Controller/E_learning/questions.pm \
	lib/Elearn/Controller/E_learning/search.pm \
	lib/Elearn/Controller/E_learning/upload.pm \
	lib/Elearn/Controller/E_learning/userData.pm \
	lib/Elearn/Controller/E_learning/watch.pm \
	lib/Elearn/Controller/Root.pm.bak \
	lib/Elearn/Controller/admin.pm.bak \
	lib/Elearn/Controller/courses.pm.bak \
	lib/Elearn/Controller/createLecture.pm.bak \
	lib/Elearn/Controller/documentCode.pm.bak \
	lib/Elearn/Controller/help.pm.bak \
	lib/Elearn/Controller/questions.pm.bak \
	lib/Elearn/Controller/search.pm.bak \
	lib/Elearn/Controller/upload.pm.bak \
	lib/Elearn/Controller/userData.pm.bak \
	lib/Elearn/Controller/watch.pm.bak \
	lib/Elearn/Model/E_learning/ElearnDB.pm \
	lib/Elearn/Model/ElearnDB.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Categories.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Categories.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Chapter.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Chapter.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/CourseModule.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/CourseModule.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Courses.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Courses.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Feedback.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Feedback.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Lecture.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Lecture.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureHasTags.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureHasTags.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureQuestions.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureQuestions.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Tags.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Tags.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/UserLectureData.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/UserLectureData.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/UserQuestionAnswers.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/UserQuestionAnswers.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/UserWatchedLecture.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/UserWatchedLecture.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Users.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Users.pm.bak \
	lib/Elearn/Schema/ElearnDB.pm.bak \
	lib/Elearn/View/E_LearningTT.pm.bak \
	lib/Elearn/View/E_learning/E_LearningTT.pm \
	lib/youtube_download.pl \
	lib/youtube_download.pl.bak

PM_TO_BLIB = lib/Elearn/Controller/E_learning/courses.pm \
	blib/lib/Elearn/Controller/E_learning/courses.pm \
	lib/Elearn/Controller/questions.pm.bak \
	blib/lib/Elearn/Controller/questions.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Categories.pm \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Categories.pm \
	lib/Elearn/Controller/search.pm.bak \
	blib/lib/Elearn/Controller/search.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureHasTags.pm \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureHasTags.pm \
	lib/Elearn/Controller/watch.pm.bak \
	blib/lib/Elearn/Controller/watch.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/CourseModule.pm.bak \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/CourseModule.pm.bak \
	lib/Elearn/Controller/documentCode.pm.bak \
	blib/lib/Elearn/Controller/documentCode.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/UserLectureData.pm.bak \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/UserLectureData.pm.bak \
	lib/Elearn/Controller/courses.pm.bak \
	blib/lib/Elearn/Controller/courses.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Chapter.pm \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Chapter.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Categories.pm.bak \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Categories.pm.bak \
	lib/Elearn/Controller/E_learning/documentCode.pm \
	blib/lib/Elearn/Controller/E_learning/documentCode.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Feedback.pm \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Feedback.pm \
	lib/Elearn.pm \
	blib/lib/Elearn.pm \
	lib/youtube_download.pl.bak \
	blib/lib/youtube_download.pl.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureQuestions.pm \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureQuestions.pm \
	lib/Elearn/Controller/E_learning/createLecture.pm \
	blib/lib/Elearn/Controller/E_learning/createLecture.pm \
	lib/Elearn/Controller/admin.pm.bak \
	blib/lib/Elearn/Controller/admin.pm.bak \
	lib/Elearn/Controller/E_learning/userData.pm \
	blib/lib/Elearn/Controller/E_learning/userData.pm \
	lib/Elearn/Controller/createLecture.pm.bak \
	blib/lib/Elearn/Controller/createLecture.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB.pm \
	blib/lib/Elearn/Schema/E_learning/ElearnDB.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Courses.pm.bak \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Courses.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Users.pm \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Users.pm \
	lib/Elearn.pm.bak \
	blib/lib/Elearn.pm.bak \
	lib/Elearn/Schema/ElearnDB.pm.bak \
	blib/lib/Elearn/Schema/ElearnDB.pm.bak \
	lib/Elearn/Controller/upload.pm.bak \
	blib/lib/Elearn/Controller/upload.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/UserQuestionAnswers.pm.bak \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/UserQuestionAnswers.pm.bak \
	lib/Elearn/Controller/userData.pm.bak \
	blib/lib/Elearn/Controller/userData.pm.bak \
	lib/Elearn/Model/E_learning/ElearnDB.pm \
	blib/lib/Elearn/Model/E_learning/ElearnDB.pm \
	lib/Elearn/Model/ElearnDB.pm.bak \
	blib/lib/Elearn/Model/ElearnDB.pm.bak \
	lib/Elearn/Controller/E_learning/questions.pm \
	blib/lib/Elearn/Controller/E_learning/questions.pm \
	lib/Elearn/Controller/E_learning/help.pm \
	blib/lib/Elearn/Controller/E_learning/help.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Lecture.pm \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Lecture.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/UserWatchedLecture.pm \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/UserWatchedLecture.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/UserLectureData.pm \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/UserLectureData.pm \
	lib/Elearn/Controller/E_learning/admin.pm \
	blib/lib/Elearn/Controller/E_learning/admin.pm \
	lib/Elearn/Controller/E_learning/search.pm \
	blib/lib/Elearn/Controller/E_learning/search.pm \
	lib/Elearn/Controller/help.pm.bak \
	blib/lib/Elearn/Controller/help.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Tags.pm \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Tags.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/UserWatchedLecture.pm.bak \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/UserWatchedLecture.pm.bak \
	lib/Elearn/View/E_LearningTT.pm.bak \
	blib/lib/Elearn/View/E_LearningTT.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/UserQuestionAnswers.pm \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/UserQuestionAnswers.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/CourseModule.pm \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/CourseModule.pm \
	lib/Elearn/Controller/E_learning/Root.pm \
	blib/lib/Elearn/Controller/E_learning/Root.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Tags.pm.bak \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Tags.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureQuestions.pm.bak \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureQuestions.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Lecture.pm.bak \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Lecture.pm.bak \
	lib/Elearn/View/E_learning/E_LearningTT.pm \
	blib/lib/Elearn/View/E_learning/E_LearningTT.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureHasTags.pm.bak \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureHasTags.pm.bak \
	lib/Elearn/Controller/Root.pm.bak \
	blib/lib/Elearn/Controller/Root.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Feedback.pm.bak \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Feedback.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Chapter.pm.bak \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Chapter.pm.bak \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Users.pm.bak \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Users.pm.bak \
	lib/Elearn/Controller/E_learning/upload.pm \
	blib/lib/Elearn/Controller/E_learning/upload.pm \
	lib/Elearn/Controller/E_learning/watch.pm \
	blib/lib/Elearn/Controller/E_learning/watch.pm \
	lib/Elearn/Schema/E_learning/ElearnDB/Result/Courses.pm \
	blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Courses.pm \
	lib/youtube_download.pl \
	blib/lib/youtube_download.pl


# --- MakeMaker platform_constants section:
MM_Unix_VERSION = 6.55_02
PERL_MALLOC_DEF = -DPERL_EXTMALLOC_DEF -Dmalloc=Perl_malloc -Dfree=Perl_mfree -Drealloc=Perl_realloc -Dcalloc=Perl_calloc


# --- MakeMaker tool_autosplit section:
# Usage: $(AUTOSPLITFILE) FileToSplit AutoDirToSplitInto
AUTOSPLITFILE = $(ABSPERLRUN)  -e 'use AutoSplit;  autosplit($$ARGV[0], $$ARGV[1], 0, 1, 1)' --



# --- MakeMaker tool_xsubpp section:


# --- MakeMaker tools_other section:
SHELL = /bin/sh
CHMOD = chmod
CP = cp
MV = mv
NOOP = $(TRUE)
NOECHO = @
RM_F = rm -f
RM_RF = rm -rf
TEST_F = test -f
TOUCH = touch
UMASK_NULL = umask 0
DEV_NULL = > /dev/null 2>&1
MKPATH = $(ABSPERLRUN) -MExtUtils::Command -e 'mkpath' --
EQUALIZE_TIMESTAMP = $(ABSPERLRUN) -MExtUtils::Command -e 'eqtime' --
FALSE = false
TRUE = true
ECHO = echo
ECHO_N = echo -n
UNINST = 0
VERBINST = 0
MOD_INSTALL = $(ABSPERLRUN) -MExtUtils::Install -e 'install([ from_to => {@ARGV}, verbose => '\''$(VERBINST)'\'', uninstall_shadows => '\''$(UNINST)'\'', dir_mode => '\''$(PERM_DIR)'\'' ]);' --
DOC_INSTALL = $(ABSPERLRUN) -MExtUtils::Command::MM -e 'perllocal_install' --
UNINSTALL = $(ABSPERLRUN) -MExtUtils::Command::MM -e 'uninstall' --
WARN_IF_OLD_PACKLIST = $(ABSPERLRUN) -MExtUtils::Command::MM -e 'warn_if_old_packlist' --
MACROSTART = 
MACROEND = 
USEMAKEFILE = -f
FIXIN = $(ABSPERLRUN) -MExtUtils::MY -e 'MY->fixin(shift)' --


# --- MakeMaker makemakerdflt section:
makemakerdflt : all
	$(NOECHO) $(NOOP)


# --- MakeMaker dist section:
TAR = tar
TARFLAGS = cvf
ZIP = zip
ZIPFLAGS = -r
COMPRESS = gzip --best
SUFFIX = .gz
SHAR = shar
PREOP = $(PERL) -I. "-MModule::Install::Admin" -e "dist_preop(q($(DISTVNAME)))"
POSTOP = $(NOECHO) $(NOOP)
TO_UNIX = $(NOECHO) $(NOOP)
CI = ci -u
RCS_LABEL = rcs -Nv$(VERSION_SYM): -q
DIST_CP = best
DIST_DEFAULT = tardist
DISTNAME = Elearn
DISTVNAME = Elearn-0.01


# --- MakeMaker macro section:


# --- MakeMaker depend section:


# --- MakeMaker cflags section:


# --- MakeMaker const_loadlibs section:


# --- MakeMaker const_cccmd section:


# --- MakeMaker post_constants section:


# --- MakeMaker pasthru section:

PASTHRU = LIBPERL_A="$(LIBPERL_A)"\
	LINKTYPE="$(LINKTYPE)"\
	PREFIX="$(PREFIX)"


# --- MakeMaker special_targets section:
.SUFFIXES : .xs .c .C .cpp .i .s .cxx .cc $(OBJ_EXT)

.PHONY: all config static dynamic test linkext manifest blibdirs clean realclean disttest distdir



# --- MakeMaker c_o section:


# --- MakeMaker xs_c section:


# --- MakeMaker xs_o section:


# --- MakeMaker top_targets section:
all :: pure_all manifypods
	$(NOECHO) $(NOOP)


pure_all :: config pm_to_blib subdirs linkext
	$(NOECHO) $(NOOP)

subdirs :: $(MYEXTLIB)
	$(NOECHO) $(NOOP)

config :: $(FIRST_MAKEFILE) blibdirs
	$(NOECHO) $(NOOP)

help :
	perldoc ExtUtils::MakeMaker


# --- MakeMaker blibdirs section:
blibdirs : $(INST_LIBDIR)$(DFSEP).exists $(INST_ARCHLIB)$(DFSEP).exists $(INST_AUTODIR)$(DFSEP).exists $(INST_ARCHAUTODIR)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists $(INST_SCRIPT)$(DFSEP).exists $(INST_MAN1DIR)$(DFSEP).exists $(INST_MAN3DIR)$(DFSEP).exists
	$(NOECHO) $(NOOP)

# Backwards compat with 6.18 through 6.25
blibdirs.ts : blibdirs
	$(NOECHO) $(NOOP)

$(INST_LIBDIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_LIBDIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_LIBDIR)
	$(NOECHO) $(TOUCH) $(INST_LIBDIR)$(DFSEP).exists

$(INST_ARCHLIB)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_ARCHLIB)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_ARCHLIB)
	$(NOECHO) $(TOUCH) $(INST_ARCHLIB)$(DFSEP).exists

$(INST_AUTODIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_AUTODIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_AUTODIR)
	$(NOECHO) $(TOUCH) $(INST_AUTODIR)$(DFSEP).exists

$(INST_ARCHAUTODIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_ARCHAUTODIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_ARCHAUTODIR)
	$(NOECHO) $(TOUCH) $(INST_ARCHAUTODIR)$(DFSEP).exists

$(INST_BIN)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_BIN)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_BIN)
	$(NOECHO) $(TOUCH) $(INST_BIN)$(DFSEP).exists

$(INST_SCRIPT)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_SCRIPT)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_SCRIPT)
	$(NOECHO) $(TOUCH) $(INST_SCRIPT)$(DFSEP).exists

$(INST_MAN1DIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_MAN1DIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_MAN1DIR)
	$(NOECHO) $(TOUCH) $(INST_MAN1DIR)$(DFSEP).exists

$(INST_MAN3DIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_MAN3DIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_MAN3DIR)
	$(NOECHO) $(TOUCH) $(INST_MAN3DIR)$(DFSEP).exists



# --- MakeMaker linkext section:

linkext :: $(LINKTYPE)
	$(NOECHO) $(NOOP)


# --- MakeMaker dlsyms section:


# --- MakeMaker dynamic section:

dynamic :: $(FIRST_MAKEFILE) $(INST_DYNAMIC) $(INST_BOOT)
	$(NOECHO) $(NOOP)


# --- MakeMaker dynamic_bs section:

BOOTSTRAP =


# --- MakeMaker dynamic_lib section:


# --- MakeMaker static section:

## $(INST_PM) has been moved to the all: target.
## It remains here for awhile to allow for old usage: "make static"
static :: $(FIRST_MAKEFILE) $(INST_STATIC)
	$(NOECHO) $(NOOP)


# --- MakeMaker static_lib section:


# --- MakeMaker manifypods section:

POD2MAN_EXE = $(PERLRUN) "-MExtUtils::Command::MM" -e pod2man "--"
POD2MAN = $(POD2MAN_EXE)


manifypods : pure_all  \
	script/elearn_server.pl \
	script/elearn_fastcgi.pl \
	script/elearn_cgi.pl \
	script/elearn_create.pl \
	script/elearn_test.pl \
	lib/Elearn/Controller/E_learning/createLecture.pm \
	lib/Elearn/Controller/E_learning/userData.pm \
	lib/Elearn/Controller/E_learning/questions.pm \
	lib/Elearn/Controller/E_learning/courses.pm \
	lib/Elearn/Controller/E_learning/help.pm \
	lib/Elearn/View/E_learning/E_LearningTT.pm \
	lib/Elearn/Controller/E_learning/admin.pm \
	lib/Elearn/Controller/E_learning/search.pm \
	lib/Elearn/Controller/E_learning/upload.pm \
	lib/Elearn/Controller/E_learning/watch.pm \
	lib/Elearn.pm \
	lib/Elearn/Controller/E_learning/documentCode.pm \
	lib/Elearn/Controller/E_learning/Root.pm \
	lib/Elearn/Model/E_learning/ElearnDB.pm
	$(NOECHO) $(POD2MAN) --section=$(MAN1EXT) --perm_rw=$(PERM_RW) \
	  script/elearn_server.pl $(INST_MAN1DIR)/elearn_server.pl.$(MAN1EXT) \
	  script/elearn_fastcgi.pl $(INST_MAN1DIR)/elearn_fastcgi.pl.$(MAN1EXT) \
	  script/elearn_cgi.pl $(INST_MAN1DIR)/elearn_cgi.pl.$(MAN1EXT) \
	  script/elearn_create.pl $(INST_MAN1DIR)/elearn_create.pl.$(MAN1EXT) \
	  script/elearn_test.pl $(INST_MAN1DIR)/elearn_test.pl.$(MAN1EXT) 
	$(NOECHO) $(POD2MAN) --section=$(MAN3EXT) --perm_rw=$(PERM_RW) \
	  lib/Elearn/Controller/E_learning/createLecture.pm $(INST_MAN3DIR)/Elearn::Controller::E_learning::createLecture.$(MAN3EXT) \
	  lib/Elearn/Controller/E_learning/userData.pm $(INST_MAN3DIR)/Elearn::Controller::E_learning::userData.$(MAN3EXT) \
	  lib/Elearn/Controller/E_learning/questions.pm $(INST_MAN3DIR)/Elearn::Controller::E_learning::questions.$(MAN3EXT) \
	  lib/Elearn/Controller/E_learning/courses.pm $(INST_MAN3DIR)/Elearn::Controller::E_learning::courses.$(MAN3EXT) \
	  lib/Elearn/Controller/E_learning/help.pm $(INST_MAN3DIR)/Elearn::Controller::E_learning::help.$(MAN3EXT) \
	  lib/Elearn/View/E_learning/E_LearningTT.pm $(INST_MAN3DIR)/Elearn::View::E_learning::E_LearningTT.$(MAN3EXT) \
	  lib/Elearn/Controller/E_learning/admin.pm $(INST_MAN3DIR)/Elearn::Controller::E_learning::admin.$(MAN3EXT) \
	  lib/Elearn/Controller/E_learning/search.pm $(INST_MAN3DIR)/Elearn::Controller::E_learning::search.$(MAN3EXT) \
	  lib/Elearn/Controller/E_learning/upload.pm $(INST_MAN3DIR)/Elearn::Controller::E_learning::upload.$(MAN3EXT) \
	  lib/Elearn/Controller/E_learning/watch.pm $(INST_MAN3DIR)/Elearn::Controller::E_learning::watch.$(MAN3EXT) \
	  lib/Elearn.pm $(INST_MAN3DIR)/Elearn.$(MAN3EXT) \
	  lib/Elearn/Controller/E_learning/documentCode.pm $(INST_MAN3DIR)/Elearn::Controller::E_learning::documentCode.$(MAN3EXT) \
	  lib/Elearn/Controller/E_learning/Root.pm $(INST_MAN3DIR)/Elearn::Controller::E_learning::Root.$(MAN3EXT) \
	  lib/Elearn/Model/E_learning/ElearnDB.pm $(INST_MAN3DIR)/Elearn::Model::E_learning::ElearnDB.$(MAN3EXT) 




# --- MakeMaker processPL section:


# --- MakeMaker installbin section:

EXE_FILES = script/elearn_cgi.pl script/elearn_create.pl script/elearn_fastcgi.pl script/elearn_server.pl script/elearn_test.pl

pure_all :: $(INST_SCRIPT)/elearn_server.pl $(INST_SCRIPT)/elearn_fastcgi.pl $(INST_SCRIPT)/elearn_cgi.pl $(INST_SCRIPT)/elearn_create.pl $(INST_SCRIPT)/elearn_test.pl
	$(NOECHO) $(NOOP)

realclean ::
	$(RM_F) \
	  $(INST_SCRIPT)/elearn_server.pl $(INST_SCRIPT)/elearn_fastcgi.pl \
	  $(INST_SCRIPT)/elearn_cgi.pl $(INST_SCRIPT)/elearn_create.pl \
	  $(INST_SCRIPT)/elearn_test.pl 

$(INST_SCRIPT)/elearn_server.pl : script/elearn_server.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/elearn_server.pl
	$(CP) script/elearn_server.pl $(INST_SCRIPT)/elearn_server.pl
	$(FIXIN) $(INST_SCRIPT)/elearn_server.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/elearn_server.pl

$(INST_SCRIPT)/elearn_fastcgi.pl : script/elearn_fastcgi.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/elearn_fastcgi.pl
	$(CP) script/elearn_fastcgi.pl $(INST_SCRIPT)/elearn_fastcgi.pl
	$(FIXIN) $(INST_SCRIPT)/elearn_fastcgi.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/elearn_fastcgi.pl

$(INST_SCRIPT)/elearn_cgi.pl : script/elearn_cgi.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/elearn_cgi.pl
	$(CP) script/elearn_cgi.pl $(INST_SCRIPT)/elearn_cgi.pl
	$(FIXIN) $(INST_SCRIPT)/elearn_cgi.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/elearn_cgi.pl

$(INST_SCRIPT)/elearn_create.pl : script/elearn_create.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/elearn_create.pl
	$(CP) script/elearn_create.pl $(INST_SCRIPT)/elearn_create.pl
	$(FIXIN) $(INST_SCRIPT)/elearn_create.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/elearn_create.pl

$(INST_SCRIPT)/elearn_test.pl : script/elearn_test.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/elearn_test.pl
	$(CP) script/elearn_test.pl $(INST_SCRIPT)/elearn_test.pl
	$(FIXIN) $(INST_SCRIPT)/elearn_test.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/elearn_test.pl



# --- MakeMaker subdirs section:

# none

# --- MakeMaker clean_subdirs section:
clean_subdirs :
	$(NOECHO) $(NOOP)


# --- MakeMaker clean section:

# Delete temporary files but do not touch installed files. We don't delete
# the Makefile here so a later make realclean still has a makefile to use.

clean :: clean_subdirs
	- $(RM_F) \
	  *$(LIB_EXT) core \
	  core.[0-9] $(INST_ARCHAUTODIR)/extralibs.all \
	  core.[0-9][0-9] $(BASEEXT).bso \
	  pm_to_blib.ts core.[0-9][0-9][0-9][0-9] \
	  $(BASEEXT).x $(BOOTSTRAP) \
	  perl$(EXE_EXT) tmon.out \
	  *$(OBJ_EXT) pm_to_blib \
	  $(INST_ARCHAUTODIR)/extralibs.ld blibdirs.ts \
	  core.[0-9][0-9][0-9][0-9][0-9] *perl.core \
	  core.*perl.*.? $(MAKE_APERL_FILE) \
	  perl $(BASEEXT).def \
	  core.[0-9][0-9][0-9] mon.out \
	  lib$(BASEEXT).def perlmain.c \
	  perl.exe so_locations \
	  $(BASEEXT).exp 
	- $(RM_RF) \
	  blib 
	- $(MV) $(FIRST_MAKEFILE) $(MAKEFILE_OLD) $(DEV_NULL)


# --- MakeMaker realclean_subdirs section:
realclean_subdirs :
	$(NOECHO) $(NOOP)


# --- MakeMaker realclean section:
# Delete temporary files (via clean) and also delete dist files
realclean purge ::  clean realclean_subdirs
	- $(RM_F) \
	  $(MAKEFILE_OLD) $(FIRST_MAKEFILE) 
	- $(RM_RF) \
	  MYMETA.yml $(DISTVNAME) 


# --- MakeMaker metafile section:
metafile :
	$(NOECHO) $(NOOP)


# --- MakeMaker signature section:
signature :
	cpansign -s


# --- MakeMaker dist_basics section:
distclean :: realclean distcheck
	$(NOECHO) $(NOOP)

distcheck :
	$(PERLRUN) "-MExtUtils::Manifest=fullcheck" -e fullcheck

skipcheck :
	$(PERLRUN) "-MExtUtils::Manifest=skipcheck" -e skipcheck

manifest :
	$(PERLRUN) "-MExtUtils::Manifest=mkmanifest" -e mkmanifest

veryclean : realclean
	$(RM_F) *~ */*~ *.orig */*.orig *.bak */*.bak *.old */*.old 



# --- MakeMaker dist_core section:

dist : $(DIST_DEFAULT) $(FIRST_MAKEFILE)
	$(NOECHO) $(ABSPERLRUN) -l -e 'print '\''Warning: Makefile possibly out of date with $(VERSION_FROM)'\''' \
	  -e '    if -e '\''$(VERSION_FROM)'\'' and -M '\''$(VERSION_FROM)'\'' < -M '\''$(FIRST_MAKEFILE)'\'';' --

tardist : $(DISTVNAME).tar$(SUFFIX)
	$(NOECHO) $(NOOP)

uutardist : $(DISTVNAME).tar$(SUFFIX)
	uuencode $(DISTVNAME).tar$(SUFFIX) $(DISTVNAME).tar$(SUFFIX) > $(DISTVNAME).tar$(SUFFIX)_uu

$(DISTVNAME).tar$(SUFFIX) : distdir
	$(PREOP)
	$(TO_UNIX)
	$(TAR) $(TARFLAGS) $(DISTVNAME).tar $(DISTVNAME)
	$(RM_RF) $(DISTVNAME)
	$(COMPRESS) $(DISTVNAME).tar
	$(POSTOP)

zipdist : $(DISTVNAME).zip
	$(NOECHO) $(NOOP)

$(DISTVNAME).zip : distdir
	$(PREOP)
	$(ZIP) $(ZIPFLAGS) $(DISTVNAME).zip $(DISTVNAME)
	$(RM_RF) $(DISTVNAME)
	$(POSTOP)

shdist : distdir
	$(PREOP)
	$(SHAR) $(DISTVNAME) > $(DISTVNAME).shar
	$(RM_RF) $(DISTVNAME)
	$(POSTOP)


# --- MakeMaker distdir section:
create_distdir :
	$(RM_RF) $(DISTVNAME)
	$(PERLRUN) "-MExtUtils::Manifest=manicopy,maniread" \
		-e "manicopy(maniread(),'$(DISTVNAME)', '$(DIST_CP)');"

distdir : create_distdir  
	$(NOECHO) $(NOOP)



# --- MakeMaker dist_test section:
disttest : distdir
	cd $(DISTVNAME) && $(ABSPERLRUN) Makefile.PL 
	cd $(DISTVNAME) && $(MAKE) $(PASTHRU)
	cd $(DISTVNAME) && $(MAKE) test $(PASTHRU)



# --- MakeMaker dist_ci section:

ci :
	$(PERLRUN) "-MExtUtils::Manifest=maniread" \
	  -e "@all = keys %{ maniread() };" \
	  -e "print(qq{Executing $(CI) @all\n}); system(qq{$(CI) @all});" \
	  -e "print(qq{Executing $(RCS_LABEL) ...\n}); system(qq{$(RCS_LABEL) @all});"


# --- MakeMaker distmeta section:
distmeta : create_distdir metafile
	$(NOECHO) cd $(DISTVNAME) && $(ABSPERLRUN) -MExtUtils::Manifest=maniadd -e 'eval { maniadd({q{META.yml} => q{Module meta-data (added by MakeMaker)}}) } ' \
	  -e '    or print "Could not add META.yml to MANIFEST: $${'\''@'\''}\n"' --



# --- MakeMaker distsignature section:
distsignature : create_distdir
	$(NOECHO) cd $(DISTVNAME) && $(ABSPERLRUN) -MExtUtils::Manifest=maniadd -e 'eval { maniadd({q{SIGNATURE} => q{Public-key signature (added by MakeMaker)}}) } ' \
	  -e '    or print "Could not add SIGNATURE to MANIFEST: $${'\''@'\''}\n"' --
	$(NOECHO) cd $(DISTVNAME) && $(TOUCH) SIGNATURE
	cd $(DISTVNAME) && cpansign -s



# --- MakeMaker install section:

install :: pure_install doc_install
	$(NOECHO) $(NOOP)

install_perl :: pure_perl_install doc_perl_install
	$(NOECHO) $(NOOP)

install_site :: pure_site_install doc_site_install
	$(NOECHO) $(NOOP)

install_vendor :: pure_vendor_install doc_vendor_install
	$(NOECHO) $(NOOP)

pure_install :: pure_$(INSTALLDIRS)_install
	$(NOECHO) $(NOOP)

doc_install :: doc_$(INSTALLDIRS)_install
	$(NOECHO) $(NOOP)

pure__install : pure_site_install
	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site

doc__install : doc_site_install
	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site

pure_perl_install :: all
	$(NOECHO) umask 022; $(MOD_INSTALL) \
		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
		$(INST_ARCHLIB) $(DESTINSTALLARCHLIB) \
		$(INST_BIN) $(DESTINSTALLBIN) \
		$(INST_SCRIPT) $(DESTINSTALLSCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLMAN3DIR)
	$(NOECHO) $(WARN_IF_OLD_PACKLIST) \
		$(SITEARCHEXP)/auto/$(FULLEXT)


pure_site_install :: all
	$(NOECHO) umask 02; $(MOD_INSTALL) \
		read $(SITEARCHEXP)/auto/$(FULLEXT)/.packlist \
		write $(DESTINSTALLSITEARCH)/auto/$(FULLEXT)/.packlist \
		$(INST_LIB) $(DESTINSTALLSITELIB) \
		$(INST_ARCHLIB) $(DESTINSTALLSITEARCH) \
		$(INST_BIN) $(DESTINSTALLSITEBIN) \
		$(INST_SCRIPT) $(DESTINSTALLSITESCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLSITEMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLSITEMAN3DIR)
	$(NOECHO) $(WARN_IF_OLD_PACKLIST) \
		$(PERL_ARCHLIB)/auto/$(FULLEXT)

pure_vendor_install :: all
	$(NOECHO) umask 022; $(MOD_INSTALL) \
		$(INST_LIB) $(DESTINSTALLVENDORLIB) \
		$(INST_ARCHLIB) $(DESTINSTALLVENDORARCH) \
		$(INST_BIN) $(DESTINSTALLVENDORBIN) \
		$(INST_SCRIPT) $(DESTINSTALLVENDORSCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLVENDORMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLVENDORMAN3DIR)

doc_perl_install :: all

doc_site_install :: all
	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLSITEARCH)/perllocal.pod
	-$(NOECHO) umask 02; $(MKPATH) $(DESTINSTALLSITEARCH)
	-$(NOECHO) umask 02; $(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" "$(INSTALLSITELIB)" \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> $(DESTINSTALLSITEARCH)/perllocal.pod

doc_vendor_install :: all


uninstall :: uninstall_from_$(INSTALLDIRS)dirs
	$(NOECHO) $(NOOP)

uninstall_from_perldirs ::

uninstall_from_sitedirs ::
	$(NOECHO) $(UNINSTALL) $(SITEARCHEXP)/auto/$(FULLEXT)/.packlist

uninstall_from_vendordirs ::



# --- MakeMaker force section:
# Phony target to force checking subdirectories.
FORCE :
	$(NOECHO) $(NOOP)


# --- MakeMaker perldepend section:


# --- MakeMaker makefile section:
# We take a very conservative approach here, but it's worth it.
# We move Makefile to Makefile.old here to avoid gnu make looping.
$(FIRST_MAKEFILE) : Makefile.PL $(CONFIGDEP)
	$(NOECHO) $(ECHO) "Makefile out-of-date with respect to $?"
	$(NOECHO) $(ECHO) "Cleaning current config before rebuilding Makefile..."
	-$(NOECHO) $(RM_F) $(MAKEFILE_OLD)
	-$(NOECHO) $(MV)   $(FIRST_MAKEFILE) $(MAKEFILE_OLD)
	- $(MAKE) $(USEMAKEFILE) $(MAKEFILE_OLD) clean $(DEV_NULL)
	$(PERLRUN) Makefile.PL 
	$(NOECHO) $(ECHO) "==> Your Makefile has been rebuilt. <=="
	$(NOECHO) $(ECHO) "==> Please rerun the $(MAKE) command.  <=="
	$(FALSE)



# --- MakeMaker staticmake section:

# --- MakeMaker makeaperl section ---
MAP_TARGET    = perl
FULLPERL      = /usr/bin/perl

$(MAP_TARGET) :: static $(MAKE_APERL_FILE)
	$(MAKE) $(USEMAKEFILE) $(MAKE_APERL_FILE) $@

$(MAKE_APERL_FILE) : $(FIRST_MAKEFILE) pm_to_blib
	$(NOECHO) $(ECHO) Writing \"$(MAKE_APERL_FILE)\" for this $(MAP_TARGET)
	$(NOECHO) $(PERLRUNINST) \
		Makefile.PL DIR= \
		MAKEFILE=$(MAKE_APERL_FILE) LINKTYPE=static \
		MAKEAPERL=1 NORECURS=1 CCCDLFLAGS=


# --- MakeMaker test section:

TEST_VERBOSE=0
TEST_TYPE=test_$(LINKTYPE)
TEST_FILE = test.pl
TEST_FILES = t/01app.t t/02pod.t t/03podcoverage.t t/controller_admin.t t/controller_courses.t t/controller_createLecture.t t/controller_documentCode.t t/controller_E_learning-Test.t t/controller_help.t t/controller_questions.t t/controller_search.t t/controller_userData.t t/model_ElearnDB.t
TESTDB_SW = -d

testdb :: testdb_$(LINKTYPE)

test :: $(TEST_TYPE) subdirs-test

subdirs-test ::
	$(NOECHO) $(NOOP)


test_dynamic :: pure_all
	PERL_DL_NONLAZY=1 $(FULLPERLRUN) "-MExtUtils::Command::MM" "-e" "test_harness($(TEST_VERBOSE), 'inc', '$(INST_LIB)', '$(INST_ARCHLIB)')" $(TEST_FILES)

testdb_dynamic :: pure_all
	PERL_DL_NONLAZY=1 $(FULLPERLRUN) $(TESTDB_SW) "-Iinc" "-I$(INST_LIB)" "-I$(INST_ARCHLIB)" $(TEST_FILE)

test_ : test_dynamic

test_static :: test_dynamic
testdb_static :: testdb_dynamic


# --- MakeMaker ppd section:
# Creates a PPD (Perl Package Description) for a binary distribution.
ppd :
	$(NOECHO) $(ECHO) '<SOFTPKG NAME="$(DISTNAME)" VERSION="0.01">' > $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <ABSTRACT>Catalyst based application</ABSTRACT>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <AUTHOR>Alvin,,,</AUTHOR>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <IMPLEMENTATION>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Action::RenderView" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Plugin::ConfigLoader" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Plugin::Static::Simple" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Runtime" VERSION="5.80022" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Config::General" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="ExtUtils::MakeMaker" VERSION="6.42" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="File::Basename" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="File::Copy" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="File::HomeDir" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Gtk2::Notify" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="JSON::" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="List::Util" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Moose::" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="WWW::Mechanize" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="YAML::XS" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="namespace::autoclean" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <ARCHITECTURE NAME="i486-linux-gnu-thread-multi-5.10" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <CODEBASE HREF="" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    </IMPLEMENTATION>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '</SOFTPKG>' >> $(DISTNAME).ppd


# --- MakeMaker pm_to_blib section:

pm_to_blib : $(FIRST_MAKEFILE) $(TO_INST_PM)
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/Elearn/Controller/E_learning/courses.pm blib/lib/Elearn/Controller/E_learning/courses.pm \
	  lib/Elearn/Controller/questions.pm.bak blib/lib/Elearn/Controller/questions.pm.bak \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/Categories.pm blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Categories.pm \
	  lib/Elearn/Controller/search.pm.bak blib/lib/Elearn/Controller/search.pm.bak \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureHasTags.pm blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureHasTags.pm \
	  lib/Elearn/Controller/watch.pm.bak blib/lib/Elearn/Controller/watch.pm.bak \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/CourseModule.pm.bak blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/CourseModule.pm.bak \
	  lib/Elearn/Controller/documentCode.pm.bak blib/lib/Elearn/Controller/documentCode.pm.bak \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/UserLectureData.pm.bak blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/UserLectureData.pm.bak \
	  lib/Elearn/Controller/courses.pm.bak blib/lib/Elearn/Controller/courses.pm.bak \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/Chapter.pm blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Chapter.pm \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/Categories.pm.bak blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Categories.pm.bak \
	  lib/Elearn/Controller/E_learning/documentCode.pm blib/lib/Elearn/Controller/E_learning/documentCode.pm \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/Feedback.pm blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Feedback.pm \
	  lib/Elearn.pm blib/lib/Elearn.pm \
	  lib/youtube_download.pl.bak blib/lib/youtube_download.pl.bak \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureQuestions.pm blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureQuestions.pm \
	  lib/Elearn/Controller/E_learning/createLecture.pm blib/lib/Elearn/Controller/E_learning/createLecture.pm \
	  lib/Elearn/Controller/admin.pm.bak blib/lib/Elearn/Controller/admin.pm.bak \
	  lib/Elearn/Controller/E_learning/userData.pm blib/lib/Elearn/Controller/E_learning/userData.pm \
	  lib/Elearn/Controller/createLecture.pm.bak blib/lib/Elearn/Controller/createLecture.pm.bak \
	  lib/Elearn/Schema/E_learning/ElearnDB.pm blib/lib/Elearn/Schema/E_learning/ElearnDB.pm \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/Courses.pm.bak blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Courses.pm.bak \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/Users.pm blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Users.pm \
	  lib/Elearn.pm.bak blib/lib/Elearn.pm.bak \
	  lib/Elearn/Schema/ElearnDB.pm.bak blib/lib/Elearn/Schema/ElearnDB.pm.bak \
	  lib/Elearn/Controller/upload.pm.bak blib/lib/Elearn/Controller/upload.pm.bak 
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/UserQuestionAnswers.pm.bak blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/UserQuestionAnswers.pm.bak \
	  lib/Elearn/Controller/userData.pm.bak blib/lib/Elearn/Controller/userData.pm.bak \
	  lib/Elearn/Model/E_learning/ElearnDB.pm blib/lib/Elearn/Model/E_learning/ElearnDB.pm \
	  lib/Elearn/Model/ElearnDB.pm.bak blib/lib/Elearn/Model/ElearnDB.pm.bak \
	  lib/Elearn/Controller/E_learning/questions.pm blib/lib/Elearn/Controller/E_learning/questions.pm \
	  lib/Elearn/Controller/E_learning/help.pm blib/lib/Elearn/Controller/E_learning/help.pm \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/Lecture.pm blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Lecture.pm \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/UserWatchedLecture.pm blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/UserWatchedLecture.pm \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/UserLectureData.pm blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/UserLectureData.pm \
	  lib/Elearn/Controller/E_learning/admin.pm blib/lib/Elearn/Controller/E_learning/admin.pm \
	  lib/Elearn/Controller/E_learning/search.pm blib/lib/Elearn/Controller/E_learning/search.pm \
	  lib/Elearn/Controller/help.pm.bak blib/lib/Elearn/Controller/help.pm.bak \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/Tags.pm blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Tags.pm \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/UserWatchedLecture.pm.bak blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/UserWatchedLecture.pm.bak \
	  lib/Elearn/View/E_LearningTT.pm.bak blib/lib/Elearn/View/E_LearningTT.pm.bak \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/UserQuestionAnswers.pm blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/UserQuestionAnswers.pm \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/CourseModule.pm blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/CourseModule.pm \
	  lib/Elearn/Controller/E_learning/Root.pm blib/lib/Elearn/Controller/E_learning/Root.pm \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/Tags.pm.bak blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Tags.pm.bak \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureQuestions.pm.bak blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureQuestions.pm.bak \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/Lecture.pm.bak blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Lecture.pm.bak \
	  lib/Elearn/View/E_learning/E_LearningTT.pm blib/lib/Elearn/View/E_learning/E_LearningTT.pm \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureHasTags.pm.bak blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/LectureHasTags.pm.bak \
	  lib/Elearn/Controller/Root.pm.bak blib/lib/Elearn/Controller/Root.pm.bak 
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/Feedback.pm.bak blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Feedback.pm.bak \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/Chapter.pm.bak blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Chapter.pm.bak \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/Users.pm.bak blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Users.pm.bak \
	  lib/Elearn/Controller/E_learning/upload.pm blib/lib/Elearn/Controller/E_learning/upload.pm \
	  lib/Elearn/Controller/E_learning/watch.pm blib/lib/Elearn/Controller/E_learning/watch.pm \
	  lib/Elearn/Schema/E_learning/ElearnDB/Result/Courses.pm blib/lib/Elearn/Schema/E_learning/ElearnDB/Result/Courses.pm \
	  lib/youtube_download.pl blib/lib/youtube_download.pl 
	$(NOECHO) $(TOUCH) pm_to_blib


# --- MakeMaker selfdocument section:


# --- MakeMaker postamble section:


# End.
# Postamble by Module::Install 0.92
# --- Module::Install::Admin::Makefile section:

realclean purge ::
	$(RM_F) $(DISTVNAME).tar$(SUFFIX)
	$(RM_F) MANIFEST.bak _build
	$(PERL) "-Ilib" "-MModule::Install::Admin" -e "remove_meta()"
	$(RM_RF) inc

reset :: purge

upload :: test dist
	cpan-upload -verbose $(DISTVNAME).tar$(SUFFIX)

grok ::
	perldoc Module::Install

distsign ::
	cpansign -s

catalyst_par :: all
	$(NOECHO) $(PERL) -Ilib -Minc::Module::Install -MModule::Install::Catalyst -e"Catalyst::Module::Install::_catalyst_par( '', 'Elearn', { CLASSES => [], CORE => 0, ENGINE => 'CGI', MULTIARCH => 0, SCRIPT => '', USAGE => q## } )"
# --- Module::Install::AutoInstall section:

config :: installdeps
	$(NOECHO) $(NOOP)

checkdeps ::
	$(PERL) Makefile.PL --checkdeps

installdeps ::
	$(NOECHO) $(NOOP)

