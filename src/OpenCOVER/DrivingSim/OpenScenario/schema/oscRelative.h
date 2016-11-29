/* This file is part of COVISE.

You can use it under the terms of the GNU Lesser General Public License
version 2.1 or later, see lgpl - 2.1.txt.

* License: LGPL 2 + */


#ifndef OSCRELATIVE_H
#define OSCRELATIVE_H

#include "oscExport.h"
#include "oscObjectBase.h"
#include "oscObjectVariable.h"

#include "oscVariables.h"

namespace OpenScenario
{
class OPENSCENARIOEXPORT Enum_Speed_Target_valueTypeType : public oscEnumType
{
public:
static Enum_Speed_Target_valueTypeType *instance();
    private:
		Enum_Speed_Target_valueTypeType();
	    static Enum_Speed_Target_valueTypeType *inst; 
};
class OPENSCENARIOEXPORT oscRelative : public oscObjectBase
{
public:
    oscRelative()
    {
        OSC_ADD_MEMBER(object);
        OSC_ADD_MEMBER(value);
        OSC_ADD_MEMBER(valueType);
        OSC_ADD_MEMBER(continuous);
    };
    oscString object;
    oscDouble value;
    oscEnum valueType;
    oscBool continuous;

    enum Enum_Speed_Target_valueType
    {
delta,
factor,

    };

};

typedef oscObjectVariable<oscRelative *> oscRelativeMember;


}

#endif //OSCRELATIVE_H
