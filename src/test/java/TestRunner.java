import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class TestRunner {

    @Test
    public void testParallel() {
        Results results = Runner.path("src/test/resources/features")
                .outputCucumberJson(true)
                .parallel(50);
        CucumberReport.generateReport(results.getReportDir());
        assertEquals(results.getErrorMessages(), 0, results.getFailCount());
    }
}
