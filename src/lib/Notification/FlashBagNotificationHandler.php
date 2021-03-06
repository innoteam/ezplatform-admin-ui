<?php

/**
 * @copyright Copyright (C) eZ Systems AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 */
declare(strict_types=1);

namespace EzSystems\EzPlatformAdminUi\Notification;

use Symfony\Component\HttpFoundation\Session\SessionInterface;

class FlashBagNotificationHandler implements NotificationHandlerInterface
{
    const TYPE_INFO = 'info';
    const TYPE_SUCCESS = 'success';
    const TYPE_WARNING = 'warning';
    const TYPE_ERROR = 'danger';

    /**
     * @var \Symfony\Component\HttpFoundation\Session\SessionInterface
     */
    protected $session;

    /**
     * @param \Symfony\Component\HttpFoundation\Session\SessionInterface $session
     */
    public function __construct(SessionInterface $session)
    {
        $this->session = $session;
    }

    /**
     * @param string $message
     */
    public function info(string $message): void
    {
        $this->session->getFlashBag()->add(self::TYPE_INFO, $message);
    }

    /**
     * @param string $message
     */
    public function success(string $message): void
    {
        $this->session->getFlashBag()->add(self::TYPE_SUCCESS, $message);
    }

    /**
     * @param string $message
     */
    public function warning(string $message): void
    {
        $this->session->getFlashBag()->add(self::TYPE_WARNING, $message);
    }

    /**
     * @param string $message
     */
    public function error(string $message): void
    {
        $this->session->getFlashBag()->add(self::TYPE_ERROR, $message);
    }
}
