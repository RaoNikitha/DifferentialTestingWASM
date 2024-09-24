;; 10. **Test 10**: Introduce `nop` within a multi-layer nested structure comprising `block`s, `if`s, and `loop`s. Ensure the correct operation of the `br` instruction to the correct nesting depth, unaffected in any way by `nop`.

(assert_invalid
  (module
    (func $nested (block
      (block
        (loop
          (if (i32.const 1)
            (then
              nop
              (br 2)))))))))
