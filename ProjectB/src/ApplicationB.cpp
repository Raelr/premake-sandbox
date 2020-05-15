#include <ProjectA.h>

class ApplicationB : public ProjectA::ApplicationA {

public: 
    ApplicationB() {

    }

    ~ApplicationB() {

    }
};

ProjectA::ApplicationA* ProjectA::createApplication() {
    return new ApplicationB;
}

