<?php
namespace Neos\ContentRepository\Domain\Context\Workspace\Event;

/*
 * This file is part of the Neos.ContentRepository package.
 *
 * (c) Contributors of the Neos Project - www.neos.io
 *
 * This package is Open Source Software. For the full copyright and license
 * information, please view the LICENSE file which was distributed with this
 * source code.
 */

use Neos\ContentRepository\Domain\ValueObject\UserIdentifier;
use Neos\ContentRepository\Domain\ValueObject\WorkspaceDescription;
use Neos\ContentRepository\Domain\ValueObject\WorkspaceName;
use Neos\ContentRepository\Domain\ValueObject\WorkspaceTitle;
use Neos\EventSourcing\Event\EventInterface;

/**
 * WorkspaceHasBeenCreated
 */
class WorkspaceHasBeenCreated implements EventInterface
{
    /**
     * @var WorkspaceName
     */
    private $workspaceName;

    /**
     * @var WorkspaceName
     */
    private $baseWorkspaceName;

    /**
     * @var WorkspaceTitle
     */
    private $workspaceTitle;

    /**
     * @var WorkspaceDescription
     */
    private $workspaceDescription;

    /**
     * @var UserIdentifier
     */
    private $workspaceOwner;

    /**
     * Constructor.
     *
     * @param WorkspaceName $workspaceName
     * @param WorkspaceName $baseWorkspaceName
     * @param WorkspaceTitle $workspaceTitle
     * @param WorkspaceDescription $workspaceDescription
     * @param UserIdentifier $workspaceOwner
     */
    public function __construct(WorkspaceName $workspaceName, WorkspaceName $baseWorkspaceName, WorkspaceTitle $workspaceTitle, WorkspaceDescription $workspaceDescription, UserIdentifier $workspaceOwner)
    {
        $this->workspaceName = $workspaceName;
        $this->baseWorkspaceName = $baseWorkspaceName;
        $this->workspaceTitle = $workspaceTitle;
        $this->workspaceDescription = $workspaceDescription;
        $this->workspaceOwner = $workspaceOwner;
    }

    /**
     * @return WorkspaceName
     */
    public function getWorkspaceName(): WorkspaceName
    {
        return $this->workspaceName;
    }

    /**
     * @return WorkspaceName
     */
    public function getBaseWorkspaceName(): WorkspaceName
    {
        return $this->baseWorkspaceName;
    }

    /**
     * @return WorkspaceTitle
     */
    public function getWorkspaceTitle(): WorkspaceTitle
    {
        return $this->workspaceTitle;
    }

    /**
     * @return WorkspaceDescription
     */
    public function getWorkspaceDescription(): WorkspaceDescription
    {
        return $this->workspaceDescription;
    }

    /**
     * @return UserIdentifier
     */
    public function getWorkspaceOwner(): UserIdentifier
    {
        return $this->workspaceOwner;
    }
}