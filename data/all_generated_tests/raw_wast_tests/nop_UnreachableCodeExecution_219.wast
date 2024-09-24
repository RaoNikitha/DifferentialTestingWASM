;; 10. **Test 10**:     - Description: Implement a series of global variable manipulations involving `nop` instructions preceding unintended `unreachable` instruction. Test if `nop` influences global state leading to false `unreachable`.    - Constraint: Establishing `nop` has no interactions with global state affecting control flow.

(assert_invalid
  (module 
    (global $g (mut i32) (i32.const 0))
    (func (global.set $g (i32.const 1)) (nop) (unreachable))
  )
  "unreachable executed"
)