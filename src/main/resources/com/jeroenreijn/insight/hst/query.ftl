<#ftl strip_whitespace=true>
<#--

    Copyright (C) 2011 Jeroen Reijn <j.reijn@onehippo.com>

    This file is part of insight-plugin-hst.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

-->
<#import "/insight-1.0.ftl" as insight />

<@insight.group label="HST Query">
    <@insight.entry name="Query" value=operation.query />
    <@insight.entry name="Limit" value=operation.limit />
    <@insight.entry name="Offset" value=operation.offset/>
</@insight.group>
