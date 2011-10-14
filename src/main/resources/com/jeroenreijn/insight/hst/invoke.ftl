<#ftl strip_whitespace=true>
<#import "/insight-1.0.ftl" as insight />

<@insight.group label="HST component">
    <@insight.entry name="Class" value=operation.componentClass/>
    <@insight.entry name="Window" value=operation.windowName />
    <@insight.entry name="Render path" value=operation.renderPath />
</@insight.group>
