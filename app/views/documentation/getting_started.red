h1. Getting Started

<!-- h3. A word from the authors -->

<div id="letter_shadow">
	<div class="letter">
		<p>*Dear build -monkey- -master- artist,*</p>

		<p>We created CruiseControl.rb so that you can kick ass.</p>

		<p>We want you to have basic continuous integration up and running 10 minutes after reading this page.
		After that, we want you to find that the tool looks good, does what you expect, and basically just
		works. Finally, when you need to do something unusual, we want you to be surprised by how easy that was, too. </p>

		<p>In short, we want you to *love* CruiseControl.rb.</p>

		Very truly yours,<br/>
		<br/>
		CruiseControl.rb team<br/>
		ThoughtWorks<br/>

		<small>P.S. We also want to know if we somehow fall short of these goals.</small>
	</div>
</div>

h1. Basics

CruiseControl.rb has two parts: a builder and a dashboard.

*Builder* is a daemon process that polls source control every once in a while for new revisions.

When someone performs a check in, the builder:

# detects it
# updates its own copy of the project
# runs the build
# notifies interested parties about the build's outcome

*Dashboard* is a web application that helps to monitor the status of project builds and troubleshoot failures.

Each installation of CruiseControl.rb may have multiple projects and multiple builders (one per project). There may
also be multiple installations of CruiseControl.rb per computer.


h1. Prerequisites

* "Ruby":http://www.ruby-lang.org/en/ 1.8.4 or later
* "Subversion":http://subversion.tigris.org/ client 1.3.2 or later
* svn and ruby executables must both be in the PATH.


h1. Assumptions and limitations

* CruiseControl.rb currently only works with Subversion.
* Dashboard and all builders need to run on the same computer.


h1. Installation

Follow these directions or watch our "5 minute install":screencasts.html screencast.


1. "Download":download.html and unpack CruiseControl.rb

  p(def). (below, we will refer to the place where you unpack it as [cruise])

2. From [cruise], run <code>./cruise add your_project --url [URL of your_project Subversion trunk]</code>.

  p(def). Optionally, you can specify username and password by adding <code> --username [your_user] --password 
    [your_password]</code> to the command.

  p(def). This creates a directory for your_project's builds at
    [cruise]/builds/your_project/, and checks out your_project from subversion URL specified to
    [cruise]/builds/your_project/work/.

  p(def hint). Hint: Rakefile of your_project should be in [cruise]/builds/your_project/work/ directory, not anywhere under
    it. A common mistake is to specify in <code>--url</code> option the root of project's SVN repository instead of the trunk.
    Rakefile then ends up in [cruise]/builds/your_project/work/trunk/ and CruiseControl.rb does not see it there.

3. From [cruise], run <code>./cruise start</code>.

  p(def hint). Hint: This starts cruise on port 3333, if you want to run your server on a different port, just type 
    <code>./cruise start -p [port]</code>

4. Browse to "http://localhost:3333":http://localhost:3333. 

  p(def). All going well, weather permitting, you will see a page with CruiseControl.rb logo. This is the dashboard, and it 
    should display your project.  If it's passing, you're done - though you should double check it's doing what it should be 
    by clicking on the project name and looking at the build log for the last build.  If it's failing or otherwise misbehaving, go 
    on to step 5.
   
5. Go to [cruise]/builds/your_project/work/ and make the build pass. 

  p(def). For a regular Rails app, this involves creating a test database, editing database.yml to connect to that 
    database, performing <code>rake RAILS_ENV=test db:migrate</code>, running <code>rake test</code> and making 
    sure that it passes.

6. Press the "build now" button on the "Dashboard":http://localhost:3333 to rebuild your project

  p(def). This should build your_project and place build outputs into [cruise]/builds/your_project/build-[revision-number]/

  p(def hint). Hint: Monitor log/your_project_builder.log for any signs of trouble. Try to check in a change to
    your_project and see if the builder can detect and build it.  Check your_project status in the dashboard.

  p(def hint). Hint: <code>./cruise help</code> displays a list of commands, <code>./cruise help [command]</code>
    displays options available for each command.


<div class="next_step">Next step: read the "manual":manual.html</div>