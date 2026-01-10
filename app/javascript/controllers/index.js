// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);

import { Tabs, Dropdown } from "tailwindcss-stimulus-components";
application.register("tabs", Tabs);
application.register("dropdown", Dropdown);
