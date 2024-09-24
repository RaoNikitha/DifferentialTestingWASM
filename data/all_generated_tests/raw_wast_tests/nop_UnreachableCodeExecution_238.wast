;; 9. Place a `nop` just before a valid branch instruction that skips over an `unreachable`. Check that control flow avoids the `unreachable` unless intended and does not trap prematurely.

 ;; (module
  (func $branching (block (nop) (br 0) (unreachable) ))
)