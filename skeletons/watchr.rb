watch('.*/.*\.php') { |m| run_phpunit m }

def run_phpunit(m)
    system "clear"
    system "phpunit --stop-on-error"
end
