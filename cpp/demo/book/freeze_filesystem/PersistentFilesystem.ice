// **********************************************************************
//
// Copyright (c) 2003-2009 ZeroC, Inc. All rights reserved.
//
// This copy of Ice is licensed to you under the terms described in the
// ICE_LICENSE file included in this distribution.
//
// **********************************************************************

#include <Filesystem.ice>

module Filesystem
{
    class PersistentDirectory;

    class PersistentNode implements Node
    {
        string nodeName;
        PersistentDirectory* parent;
    };

    ["cpp:virtual"]class PersistentFile extends PersistentNode implements File
    {
        Lines text;
    };

    dictionary<string, NodeDesc> NodeDict;

    ["cpp:virtual"]class PersistentDirectory extends PersistentNode implements Directory
    {
        ["freeze:write"]
        void removeNode(string name);

        NodeDict nodes;
    };
};
