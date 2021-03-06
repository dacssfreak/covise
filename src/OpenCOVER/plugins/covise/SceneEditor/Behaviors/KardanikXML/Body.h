/* This file is part of COVISE.

   You can use it under the terms of the GNU Lesser General Public License
   version 2.1 or later, see lgpl-2.1.txt.

 * License: LGPL 2+ */

/*
 * Body.h
 *
 *  Created on: Jan 2, 2012
 *      Author: jw_te
 */

#pragma once
#ifndef BODY_H_
#define BODY_H_

#include <string>
#include <vector>
#ifndef WIN32
#include <boost/tr1/memory.hpp>
#endif
#include <memory>

namespace KardanikXML
{

class Anchor;
class LineStrip;
class Line;
class Point;
class Joint;
class OperatingRange;
class Construction;

class Body
{
public:
    typedef std::vector<std::tr1::shared_ptr<LineStrip> > LineStrips;
    typedef std::vector<std::tr1::shared_ptr<Line> > Lines;
    typedef std::vector<std::tr1::shared_ptr<Point> > Points;

    Body();
    Body(const std::string &name);

    enum MotionType
    {
        MOTION_STATIC,
        MOTION_DYNAMIC,
        MOTION_DYNAMIC_NOCOLLISION
    };

    void SetRadius(float radius);
    float GetRadius() const;

    void SetName(const std::string &name);
    const std::string &GetName() const;

    void SetMotionID(unsigned int id);
    unsigned int GetMotionID() const;

    const LineStrips &GetLineStrips() const;
    void AddLineStrip(std::tr1::shared_ptr<LineStrip> lineStrip);

    const Lines &GetLines() const;
    void AddLine(std::tr1::shared_ptr<Line> line);

    const Points &GetPoints() const;
    void AddPoint(std::tr1::shared_ptr<Point> point);

    std::tr1::shared_ptr<Point> GetPointByName(const std::string &name) const;
    MotionType GetMotionType() const;
    void SetMotionType(MotionType motionType);
    void SetMotionType(const std::string &motionType);

    std::tr1::shared_ptr<Anchor> GetAnchor() const;
    void SetAnchor(std::tr1::shared_ptr<Anchor> anchor);

    const std::vector<std::tr1::shared_ptr<OperatingRange> > &GetOperatingRanges() const;
    void AddOperatingRange(std::tr1::shared_ptr<OperatingRange> range);

    void AddConnectedJoint(std::tr1::shared_ptr<Joint> connectedJoint);
    const std::vector<std::tr1::weak_ptr<Joint> > &GetConnectedJoints() const;

    void SetParentConstruction(std::tr1::weak_ptr<Construction> construction);
    std::tr1::weak_ptr<Construction> GetParentConstruction() const;

private:
    std::string m_Name;

    LineStrips m_LineStrips;
    Lines m_Lines;
    Points m_Points;
    std::tr1::shared_ptr<Anchor> m_Anchor;
    typedef std::vector<std::tr1::shared_ptr<OperatingRange> > OperatingRanges;
    OperatingRanges m_OperatingRanges;
    std::tr1::weak_ptr<Construction> m_ParentConstruction;
    MotionType m_MotionType;
    float m_Radius;
    unsigned int m_MotionID;

    typedef std::vector<std::tr1::weak_ptr<Joint> > ConnectedJoints;
    ConnectedJoints m_ConnectedJoints;
};
}

#endif /* BODY_H_ */
