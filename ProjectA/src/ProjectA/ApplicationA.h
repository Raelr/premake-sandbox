#ifndef APPLICATION_A_H
#define APPLICATION_A_H

#include "Core.h"

namespace ProjectA {

    class SCY_API ApplicationA {
        public:
            ApplicationA();
            ~ApplicationA();
            void run();
    };

    ApplicationA* createApplication();
}

#endif