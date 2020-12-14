using Hangfire;
using Hangfire.Server;
using System;
using System.Collections.Generic;
using System.Text;
using TSC.Composition.Services.Shared.MessageFormats;
using TSC.Composition.Services.Shared.Queues;

namespace TSC.Composition.Services.Shared.Interfaces
{
    public interface IScheduler
    {
        [JobDisplayName("Scheduler - High Volume - {0}")]
        [Queue(SchedulerQueues.HighVolumeQueue)]
        [AutomaticRetry(Attempts = 0)]
        string RunHighVolumeSchedule(CompositionMessage msg, PerformContext context);

        [JobDisplayName("Scheduler - Low Volume - {0}")]
        [Queue(SchedulerQueues.LowVolumQueue)]
        [AutomaticRetry(Attempts = 0)]
        string RunLowVolumeSchedule(CompositionMessage message, PerformContext context);
    }
}
