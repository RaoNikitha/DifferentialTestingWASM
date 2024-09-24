;; 8. Develop a block with an iterator loop, where each iteration uses `br_if` conditioned on a loop counter. Assert the result after exiting the block based on condition checks during each iteration.

(assert_invalid
  (module (func $block_with_loop (result i32)
    (local $counter i32)
    (block $exit (result i32)
      (loop $loop
        (br_if $exit (i32.eqz (local.get $counter)))
        (local.set $counter (i32.sub (local.get $counter) (i32.const 1)))
        (br $loop)
      )
    )
  ))
  "type mismatch"
)