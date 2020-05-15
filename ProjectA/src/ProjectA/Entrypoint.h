#ifndef PREMAKE_TEST_ENTRYPOINT_H
#define PREMAKE_TEST_ENTRYPOINT_H

#include "Core.h"
#include <spdlog/spdlog.h>

#ifdef SCY_MAC_BUILD

extern ProjectA::ApplicationA* ProjectA::createApplication();

int main() {
    spdlog::info("Starting app.");
    auto app = ProjectA::createApplication();
    spdlog::info("Running app.");
    app -> run();
    spdlog::info("Stopping app - releasing memory");
    delete app;
    return 0;
}

#endif
#endif