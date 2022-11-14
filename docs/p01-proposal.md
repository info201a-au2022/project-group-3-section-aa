# How demographics information related to chances of having cancer and the success rates of different treatments

## Project Requirements

**Code Name**: Cancer

**Author**:
- Lolly Zhao (lollyz@uw.edu)
- Vicky Huang (zhihuang@uw.edu)
- Allison Ho (qnho@uw.edu)

**Affiliation**: INFO-201: Technical Foundations of Informatics - The Information School
- University of Washington

**Date**: Autumn 2022

**Abstract**: Our main question is to figure out whether there is a relationship between
the demographics of people in the US and cancer risk. This question is important because
we need more information on whether a group of people has a higher chance of having cancer
than others so that we can develop preventive methods. In addition, understanding this
relationship can also give us more information on whether a specific kind of gene has any
impact after we have learned about the societal scope. To address the question, we will
use data from CDC and the American Cancer Society to better analyze this relationship.

**Keywords**: cancer, cancer treatment, cancer risk, cancer support

**Introduction**: Cancer is one of the most common diseases with a very high mortality rate.
Our project is to analyze datasets of various cancer types and their treatments in different
parts of the United States so that people won’t be frustrated and will have some ideas of
various types of cancer and symptoms at different cancer stages. Also, we have data
visualization on different cancer cases caused by different areas, different living conditions,
and different types of cancer in different ages and genders, and how to prevent cancer early
through daily practice. Our purpose of this project is not only aiming to assist people in
this community to reduce their number of cases and increase survival rates based on our
insightful analysis, but we also want our project to make people pay more attention to
cancer prevention.

**Problem Domain**:
- _Framing the problem domain_: Cancer is a disease that affects many people’s lives, both
directly and indirectly. As researchers and doctors work to find a cure or an effective
treatment for cancer, good cancer data analysis is much needed, as they can provide lots of
underlying information that datasets alone cannot convey.
- _Value_: The value criterion on human values includes inclusivity, privacy, and accessibility
for cancer support groups within the community. Human values in perceiving and caring for cancers
affect how society sees and treats cancer patients. Till today, there is evidence of myths
associated with cancer, such as the belief that cancer is fatal, cancer can be a religious karma,
or cancer is contagious. These types of beliefs about cancer can cultivate stigma towards the
disease, which makes cancer patients more vulnerable and targeted in society. There are also fears
of cancer as some patients are afraid of the technology or drug use that will affect their health,
thus affecting their chances of surviving. In terms of privacy, cancer data are highly confidential.
Patients have the right to decide whether to share their personal information or discuss issues of
cancer types, personal matters, and treatment costs with physicians. At the state level, the
legislature has made efforts to enforce and make laws to protect patients' privacy. (National
Cancer Institute, n.d.) For example, information about a patient would be removed when data is
reported. Moreover, researchers need to submit requests and get permission from the authority to
get information about specific data. Last but not least, cancer patients need to find a sense of
belonging, a place where they are valued and loved. Right now, there are volunteer lead and
community-based support groups that are accessible to the cancer community. These groups create
a safe environment for cancer patients to share their feelings, get resources and support,
and exchange ideas and tips to get better.
- _Stakeholders_: Direct stakeholders are patient, patient’s family and doctors. Indirect
stakeholders are researchers who are doing cancer research or students studying about data science.
- _Benefits_: We need more information to know whether a group of people has a higher incidence
of cancer than others, after understanding the social scale, we know more about whether a
particular gene has an effect. So that medical institutions can develop prevention methods
and cancer patients can be treated more effectively which means reducing the number of cases
and increasing survival rates.
- _Harms_: Because the dataset we can collect is minimum so there can be some misrepresentation
or a lack of information on one group of people altogether. This leads to a group will be
excluded and others having a higher chance of having cancer. Another harm is that this analysis
uses lots of personal information from patients so if we don’t handle them well, patients’
information can be posted online and invade their privacy. In addition, we use a dataset that
demonstrates the death rates of cancer cases in the US, which could be viewed as sensitive
information by some people and make them uncomfortable.

**Limitations**:
- A lot of clean datasets are restricted, so we may have to work with lofty datasets.
- We just have basic knowledge about cancer so I think it will be hard to draw detailed
conclusions without a thorough research
- It’s hard to find a dataset for immunotherapy as this is a new way of treating cancer and
most of the databases are restricted
- The limitation is that as undergraduate students, it is difficult for us to get access to
professional medical databases which only provided for certain medical institutions' research.
- In some states, patients' information is private, our dataset would only approximately
calculate the numbers or round up by certain methods.
- While we analyze the cancer people’s age groups and their locations, it is difficult for us
to track people’s actual age range and their cancer process. Since some of the patients would
have cancer before they were actually diagnosed. Also, they may move to other states which
will make our data on locating the cases very unclear.

**Research questions**:
- Which risks factors accounts for the most cancer cases in the US
- Is there a relationship between areas of living and the chance of having cancer?
- Is there a relationship between ages and the chance of having cancer?

**Dataset**:
Each of these datasets will help answer one question in from research questions, such as
there is a dataset for the correlation between US states and the number of cancer cases
and the cancer cases by ages. By looking at these data and their visualization, we can
obtain evidence for our answers to our research questions.

|              Name             | # of columns | # of rows |
|-------------------------------|--------------|-----------|
| Cancer Types Grouped by Areas |      15      |  1048575  |
| Cancer Types Grouped by Age   |      12      |   327066  |
|    Cancer Risk Factors        |      42      |   214     |

_File Description_:

[Cancer Types Grouped by Areas](https://www.johnsnowlabs.com/marketplace/cancer-types-grouped-by-area/):

a)Who: John Snows Lab
  When: last updated 2019
  Purpose: collect data under the Cancer Registries Amendment Act

b) CDC’s National Program of Cancer Registries (NPCR) funded. The doctors and
researchers will be benefited from the data

c)CDC validates the data

d) I searched on data.world


[Cancer Types Grouped by Age](https://www.johnsnowlabs.com/marketplace/cancer-types-grouped-by-age/):

a)Who: John Snows Lab
  When: last updated 2019
  Purpose: collect data under the Cancer Registries Amendment Act

b) CDC’s National Program of Cancer Registries (NPCR) funded. The doctors and
researchers will be benefited from the data

c)CDC validates the data

d) I searched on data.world

[Cancer Risk Factors](https://canceratlas.cancer.org/risk-factors/):

a)Who: The Cancer Atlas
  When: since 2019
  Purpose: provide information on risk factors of cancers for advocates, government,
  and health agencies

b) Produced by the American Cancer Society, the International Agency for Research on Cancer,
and the Union for International Cancer Control

c)American Cancer Society, the International Agency for Research on Cancer,
and the Union for International Cancer Control validate the data

d) I searched on Google



**Expected implications**:
The expected implication is that this analysis will provide policymakers with specific
information about different cancer treatments along with their success rate. In addition,
they will have more knowledge on how different social demographics related to chances of
having cancer. Thus, helping them create better and more inclusive treatments and preventions.



**Acknowledgement**: I would like to thank all my teammates that came up with this project
topic and are all making effort on contributing to this project. Also, I would like to thank
our professor to give us a chance to let us do our own research on finding out our own topics.
And Thanks to our TA, Lilia by assign three of us together and also be prepared to answer our
questions while we are stuck on further process.

**Reference**:
NATIONAL CANCER INSTITUDE. (n.d.). Confidentiality. Confidentiality | SEER Training.
Retrieved October 31, 2022, from
https://training.seer.cancer.gov/registration/data/confidentiality.html


**Appendix A: questions**:
- Which part would you like to see more about our topic on Cancer?
- Do you have any specific questions that you want us to point out and solve in our project?
- Do you think it would be a good idea to add gender difference in our research？
- Do you have any suggestions in improving the quality of our project in general?










