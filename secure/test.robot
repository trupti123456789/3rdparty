*** Settings ***
Resource            Common.robot
Library                    QWeb
Library                    QForce
Suite Setup                Setup Browser
Suite Teardown             End suite
Library                    QVision
Library                    DataDriver                  reader_class=TestDataApi    name=Sec3.xlsx
*** Test Cases ***
BS3
    [Tags]                 thursday
    #Login to QA
    Run keywords           Home
    #Article creation
    Launchapp              Knowledge
    Clicktext              New                         anchor=publish
    Clicktext             	FAQ
    Clicktext              Content Catalog
    Clicktext              Next
    UseModal               On
    TypeText               Title                       marchSub
    Verifytext             URL Name
    MultiPickList          Article Audience           Sales Marketing
    Sleep                  2
    ClickText              Move selection to Chosen    anchor=Available
    PickList               Topic                      IT
    PickList               Sub-Topic                  CRM support
    ClickText              Save                        partial_match=False
    UseModal               Off
    Sleep                  5
    Launchapp              Knowledge
    ClickText              Select a List View: Knowledge
    ClickText              All Articles
    ClickElement           xpath= //span[contains(text(),'Created Date')]
    ClickText              marchSub
    #verifyinf the article data
    Verifyfield            Title                        marchSub
    VerifyAll              URL Name,Knowledge Community URL
    VerifyAll              Article Audience,Topic,Sub-Topic
    #publishing the article
    Clicktext              publish
    Usemodal               On
    ClickText              Schedule publication on:    recognition_mode=vision
    Clicktext              publish
    #knowledge base validation
    Launchapp              Knowledge Base              connected_app=True
    Switch Window          NEW
    Verifytext             Knowledge Base
    QVision.VerifyText     NEW ARTICLES
    QVision.VerifyText     visa1
    Clicktext              Sales & Marketing Knowledge Base
    Switch Window          NEW
    #verifying articles in knowledge base
    QVision.VerifyText     SALES LEARNING
    QVision.VerifyText     Sales Supplementals
    QVision.ClickText      Sales Supplementals
    QVision.Verifytext     AdobeSign
    QVision.Verifytext     GovWin(SLED only)
    QVision.Verifytext     Quick Hit Webinars
    QVision.Verifytext     SKO FY25
    QVision.Verifytext     TI Summit 2023
    SwitchWindow           2
    QVision.ClickText      Knowledge Content Request
    Usemodal               On
    QVision.VerifyText     Knowledge Content Request$
    DropDown               Content Request Type         New           partial_match=False
    VerifyText             Knowledge Content Request
    Clicktext              Next
    #filling data in knowledge content request
    Usemodal               On
    QVision.VerifyText     Article Subject
    # ClickElement         xpath= //*[@id="input-191"]
    QVision.TypeText       Article Subject             March1
    QVision.VerifyText     Article Title
    # ClickElement         xpath= //*[@id="input-196"]
    QVision.TypeText       Article Title               MarchT
    QVision.VerifyText     Article Details
    Clicktext              Bold
    TypeText               Article Details           Requested
    QVision.VerifyText     Article Group
    DropDown               Article Group               Sales Operations
    Clicktext              Next
    Sleep                  4
    #uploading file
    Clicktext              Upload Files
    QVision.DoubleClick    test
    QVision.DoubleClick    screenshots
    QVision.Clicktext      screenshot-Live_Testing_session-1.png
    QVision.Clicktext      Open                        anchor=Cancel
    Clicktext              Done
    Clicktext              Next
    Clicktext              Finish
    #Atlas help for mail
    QVision.VerifyText     Atlas Help
    QVision.ClickText      Atlas Help
    QVision.ClickText              Ok
    SwitchWindow           NEW
    QVision.Clicktext      Got it
    QVision.Clicktext      Get Started
    QVision.Clicktext      Gmail
    QVision.Clicktext      Compose
    QVision.Verifytext     To
    CloseWindow
    SwitchWindow           1
    Run keywords           Home
    #Subscribing Article
    Launchapp              Knowledge Base              connected_app=True
    QVision.VerifyText     INDUSTRY REPORTS
    QVision.Clicktext      IDC
    SwitchWindow           NEW
    Swipe Right            2
    Clicktext              //body/div[3]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/c-article-layout-l-w-c[1]/div[1]/div[1]/div[1]/div[2]/div[2]/lightning-icon[1]
    SwitchWindow           2
    Refreshpage
    #verifying article in subscription
    QVision.VerifyText     MY SUBSCRIBED ARTICLES
    QVision.VerifyText     IDC
    SwitchWindow           1
    #Version changing
    Launchapp              Knowledge
    ClickText              Select a List View: Knowledge
    ClickText              All Articles                partial_match=False
    ClickElement           xpath= //span[contains(text(),'Created Date')]
    Clicktext               marchSub
    Clicktext              Edit as Draft               anchor=Archieve
    Verifytext             The published version will remain online until you publish this draft.
    Clicktext              Edit as Draft               anchor=Cancel
    Usemodal               On
    TypeText               Title                       Macho
    Clicktext              Save
    Clicktext              Publish
    Usemodal               On
    ClickText              Schedule publication on:
    Clicktext              publish
    ##version tab not visible

    #Verifying version change in knowledge base
    Launchapp              Knowledge Base              connected_app=True
    SwitchWindow           NEW
    TypeText               What can we help you find?                              Macho
    Clicktext              Search
    Wait And Increase Sleep Time                        ${initial_sleep_time}
    Clicktext                Macho
    ClickText              Ok
    VerifyText             Macho



