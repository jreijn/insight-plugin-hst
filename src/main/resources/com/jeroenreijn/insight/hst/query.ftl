<#ftl strip_whitespace=true>
<#import "/insight-1.0.ftl" as insight />

<@insight.group label="HST Query">
    <@insight.entry name="Query" value=operation.query />
    <@insight.entry name="Limit" value=operation.limit />
    <@insight.entry name="Offset" value=operation.offset/>
</@insight.group>
