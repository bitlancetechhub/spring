<aside class="left-sidebar">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav">
                <li class="sidebar-item">
                    <a href="{{ route('home') }}" class="sidebar-link">
                        <i data-feather="droplet" class="mr-2"></i>
                        <span class="hide-menu"> Dashboard </span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a href="{{ route('users') }}" class="sidebar-link">
                        <i data-feather="users" class="mr-2"></i>
                        <span class="hide-menu"> Users </span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a href="{{ route('organizations') }}" class="sidebar-link">
                        <i data-feather="home" class="mr-2"></i>
                        <span class="hide-menu"> Organizations </span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a href="{{ route('subscriptions') }}" class="sidebar-link">
                        <i data-feather="sun" class="mr-2"></i>
                        <span class="hide-menu"> Subscriptions </span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a href="{{ route('helps') }}" class="sidebar-link">
                        <i data-feather="help-circle" class="mr-2"></i>
                        <span class="hide-menu"> Help </span>
                    </a>
                </li>
    
                <li class="sidebar-item">
                    <a href="{{ route('home') }}" class="sidebar-link">
                        <i data-feather="bell" class="mr-2"></i>
                        <span class="hide-menu"> Notifications </span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a href="{{ route('home') }}" class="sidebar-link">
                        <i data-feather="layers" class="mr-2"></i>
                        <span class="hide-menu"> Reports </span>
                    </a>
                </li>

               
                </li>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>