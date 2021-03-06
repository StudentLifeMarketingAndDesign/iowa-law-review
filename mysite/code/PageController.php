<?php

namespace {

    use SilverStripe\CMS\Controllers\ContentController;

    class PageController extends ContentController
    {
        /**
         * An array of actions that can be accessed via a request. Each array element should be an action name, and the
         * permissions or conditions required to allow the user to access it.
         *
         * <code>
         * [
         *     'action', // anyone can access this action
         *     'action' => true, // same as above
         *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
         *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
         * ];
         * </code>
         *
         * @var array
         */
        private static $allowed_actions = [];

        protected function init()
        {
            parent::init();
            // You can include any CSS or JS required by your project here.
            // See: https://docs.silverstripe.org/en/developer_guides/templates/requirements/
        }
        public function Breadcrumbs($maxDepth = 20, $unlinked = false, $stopAtPageType = false, $showHidden = false) {
            return parent::Breadcrumbs(20, false, false, true);
        }

        public function LatestPrintIssue() {
            $latestIssue = Issue::get()->filter(array('ParentID' => 7))->sort(
                array('Volume' => 'DESC', 'Number' => 'DESC')
            )->First();
            return $latestIssue;
        }
        public function LatestOnlineIssue() {
            $printIssueHolder = IssueHolder::get()->filter(array('URLSegment' => 'online'))->First();

            if ($printIssueHolder) {
                $latestIssue = Issue::get()->filter(array('ParentID' => $printIssueHolder->ID))->sort('OriginalPublicationDate')->First();
                return $latestIssue;
            }
        }

    }
}
