
test:     file format elf32-i386


Disassembly of section .init:

080482b4 <_init>:
 80482b4:	53                   	push   %ebx
 80482b5:	83 ec 08             	sub    $0x8,%esp
 80482b8:	e8 93 00 00 00       	call   8048350 <__x86.get_pc_thunk.bx>
 80482bd:	81 c3 43 1d 00 00    	add    $0x1d43,%ebx
 80482c3:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 80482c9:	85 c0                	test   %eax,%eax
 80482cb:	74 05                	je     80482d2 <_init+0x1e>
 80482cd:	e8 2e 00 00 00       	call   8048300 <__gmon_start__@plt>
 80482d2:	83 c4 08             	add    $0x8,%esp
 80482d5:	5b                   	pop    %ebx
 80482d6:	c3                   	ret    

Disassembly of section .plt:

080482e0 <printf@plt-0x10>:
 80482e0:	ff 35 04 a0 04 08    	pushl  0x804a004
 80482e6:	ff 25 08 a0 04 08    	jmp    *0x804a008
 80482ec:	00 00                	add    %al,(%eax)
	...

080482f0 <printf@plt>:
 80482f0:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 80482f6:	68 00 00 00 00       	push   $0x0
 80482fb:	e9 e0 ff ff ff       	jmp    80482e0 <_init+0x2c>

08048300 <__gmon_start__@plt>:
 8048300:	ff 25 10 a0 04 08    	jmp    *0x804a010
 8048306:	68 08 00 00 00       	push   $0x8
 804830b:	e9 d0 ff ff ff       	jmp    80482e0 <_init+0x2c>

08048310 <__libc_start_main@plt>:
 8048310:	ff 25 14 a0 04 08    	jmp    *0x804a014
 8048316:	68 10 00 00 00       	push   $0x10
 804831b:	e9 c0 ff ff ff       	jmp    80482e0 <_init+0x2c>

Disassembly of section .text:

08048320 <_start>:
 8048320:	31 ed                	xor    %ebp,%ebp
 8048322:	5e                   	pop    %esi
 8048323:	89 e1                	mov    %esp,%ecx
 8048325:	83 e4 f0             	and    $0xfffffff0,%esp
 8048328:	50                   	push   %eax
 8048329:	54                   	push   %esp
 804832a:	52                   	push   %edx
 804832b:	68 40 85 04 08       	push   $0x8048540
 8048330:	68 d0 84 04 08       	push   $0x80484d0
 8048335:	51                   	push   %ecx
 8048336:	56                   	push   %esi
 8048337:	68 35 84 04 08       	push   $0x8048435
 804833c:	e8 cf ff ff ff       	call   8048310 <__libc_start_main@plt>
 8048341:	f4                   	hlt    
 8048342:	66 90                	xchg   %ax,%ax
 8048344:	66 90                	xchg   %ax,%ax
 8048346:	66 90                	xchg   %ax,%ax
 8048348:	66 90                	xchg   %ax,%ax
 804834a:	66 90                	xchg   %ax,%ax
 804834c:	66 90                	xchg   %ax,%ax
 804834e:	66 90                	xchg   %ax,%ax

08048350 <__x86.get_pc_thunk.bx>:
 8048350:	8b 1c 24             	mov    (%esp),%ebx
 8048353:	c3                   	ret    
 8048354:	66 90                	xchg   %ax,%ax
 8048356:	66 90                	xchg   %ax,%ax
 8048358:	66 90                	xchg   %ax,%ax
 804835a:	66 90                	xchg   %ax,%ax
 804835c:	66 90                	xchg   %ax,%ax
 804835e:	66 90                	xchg   %ax,%ax

08048360 <deregister_tm_clones>:
 8048360:	b8 23 a0 04 08       	mov    $0x804a023,%eax
 8048365:	2d 20 a0 04 08       	sub    $0x804a020,%eax
 804836a:	83 f8 06             	cmp    $0x6,%eax
 804836d:	77 01                	ja     8048370 <deregister_tm_clones+0x10>
 804836f:	c3                   	ret    
 8048370:	b8 00 00 00 00       	mov    $0x0,%eax
 8048375:	85 c0                	test   %eax,%eax
 8048377:	74 f6                	je     804836f <deregister_tm_clones+0xf>
 8048379:	55                   	push   %ebp
 804837a:	89 e5                	mov    %esp,%ebp
 804837c:	83 ec 18             	sub    $0x18,%esp
 804837f:	c7 04 24 20 a0 04 08 	movl   $0x804a020,(%esp)
 8048386:	ff d0                	call   *%eax
 8048388:	c9                   	leave  
 8048389:	c3                   	ret    
 804838a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048390 <register_tm_clones>:
 8048390:	b8 20 a0 04 08       	mov    $0x804a020,%eax
 8048395:	2d 20 a0 04 08       	sub    $0x804a020,%eax
 804839a:	c1 f8 02             	sar    $0x2,%eax
 804839d:	89 c2                	mov    %eax,%edx
 804839f:	c1 ea 1f             	shr    $0x1f,%edx
 80483a2:	01 d0                	add    %edx,%eax
 80483a4:	d1 f8                	sar    %eax
 80483a6:	75 01                	jne    80483a9 <register_tm_clones+0x19>
 80483a8:	c3                   	ret    
 80483a9:	ba 00 00 00 00       	mov    $0x0,%edx
 80483ae:	85 d2                	test   %edx,%edx
 80483b0:	74 f6                	je     80483a8 <register_tm_clones+0x18>
 80483b2:	55                   	push   %ebp
 80483b3:	89 e5                	mov    %esp,%ebp
 80483b5:	83 ec 18             	sub    $0x18,%esp
 80483b8:	89 44 24 04          	mov    %eax,0x4(%esp)
 80483bc:	c7 04 24 20 a0 04 08 	movl   $0x804a020,(%esp)
 80483c3:	ff d2                	call   *%edx
 80483c5:	c9                   	leave  
 80483c6:	c3                   	ret    
 80483c7:	89 f6                	mov    %esi,%esi
 80483c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080483d0 <__do_global_dtors_aux>:
 80483d0:	80 3d 20 a0 04 08 00 	cmpb   $0x0,0x804a020
 80483d7:	75 13                	jne    80483ec <__do_global_dtors_aux+0x1c>
 80483d9:	55                   	push   %ebp
 80483da:	89 e5                	mov    %esp,%ebp
 80483dc:	83 ec 08             	sub    $0x8,%esp
 80483df:	e8 7c ff ff ff       	call   8048360 <deregister_tm_clones>
 80483e4:	c6 05 20 a0 04 08 01 	movb   $0x1,0x804a020
 80483eb:	c9                   	leave  
 80483ec:	f3 c3                	repz ret 
 80483ee:	66 90                	xchg   %ax,%ax

080483f0 <frame_dummy>:
 80483f0:	a1 10 9f 04 08       	mov    0x8049f10,%eax
 80483f5:	85 c0                	test   %eax,%eax
 80483f7:	74 1f                	je     8048418 <frame_dummy+0x28>
 80483f9:	b8 00 00 00 00       	mov    $0x0,%eax
 80483fe:	85 c0                	test   %eax,%eax
 8048400:	74 16                	je     8048418 <frame_dummy+0x28>
 8048402:	55                   	push   %ebp
 8048403:	89 e5                	mov    %esp,%ebp
 8048405:	83 ec 18             	sub    $0x18,%esp
 8048408:	c7 04 24 10 9f 04 08 	movl   $0x8049f10,(%esp)
 804840f:	ff d0                	call   *%eax
 8048411:	c9                   	leave  
 8048412:	e9 79 ff ff ff       	jmp    8048390 <register_tm_clones>
 8048417:	90                   	nop
 8048418:	e9 73 ff ff ff       	jmp    8048390 <register_tm_clones>

0804841d <calc>:
 804841d:	55                   	push   %ebp
 804841e:	89 e5                	mov    %esp,%ebp
 8048420:	83 ec 30             	sub    $0x30,%esp
 8048423:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048426:	8b 55 08             	mov    0x8(%ebp),%edx
 8048429:	01 c2                	add    %eax,%edx
 804842b:	8b 45 10             	mov    0x10(%ebp),%eax
 804842e:	89 10                	mov    %edx,(%eax)
 8048430:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048433:	c9                   	leave  
 8048434:	c3                   	ret    

08048435 <main>:
 8048435:	55                   	push   %ebp
 8048436:	89 e5                	mov    %esp,%ebp
 8048438:	83 e4 f0             	and    $0xfffffff0,%esp
 804843b:	83 ec 20             	sub    $0x20,%esp
 804843e:	c7 44 24 18 01 00 00 	movl   $0x1,0x18(%esp)
 8048445:	00 
 8048446:	c7 44 24 1c 02 00 00 	movl   $0x2,0x1c(%esp)
 804844d:	00 
 804844e:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
 8048455:	00 
 8048456:	8b 44 24 14          	mov    0x14(%esp),%eax
 804845a:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804845e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 8048462:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048466:	8b 44 24 18          	mov    0x18(%esp),%eax
 804846a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804846e:	c7 04 24 60 85 04 08 	movl   $0x8048560,(%esp)
 8048475:	e8 76 fe ff ff       	call   80482f0 <printf@plt>
 804847a:	8d 44 24 14          	lea    0x14(%esp),%eax
 804847e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048482:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 8048486:	89 44 24 04          	mov    %eax,0x4(%esp)
 804848a:	8b 44 24 18          	mov    0x18(%esp),%eax
 804848e:	89 04 24             	mov    %eax,(%esp)
 8048491:	e8 87 ff ff ff       	call   804841d <calc>
 8048496:	89 44 24 18          	mov    %eax,0x18(%esp)
 804849a:	8b 44 24 14          	mov    0x14(%esp),%eax
 804849e:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80484a2:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 80484a6:	89 44 24 08          	mov    %eax,0x8(%esp)
 80484aa:	8b 44 24 18          	mov    0x18(%esp),%eax
 80484ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 80484b2:	c7 04 24 88 85 04 08 	movl   $0x8048588,(%esp)
 80484b9:	e8 32 fe ff ff       	call   80482f0 <printf@plt>
 80484be:	b8 00 00 00 00       	mov    $0x0,%eax
 80484c3:	c9                   	leave  
 80484c4:	c3                   	ret    
 80484c5:	66 90                	xchg   %ax,%ax
 80484c7:	66 90                	xchg   %ax,%ax
 80484c9:	66 90                	xchg   %ax,%ax
 80484cb:	66 90                	xchg   %ax,%ax
 80484cd:	66 90                	xchg   %ax,%ax
 80484cf:	90                   	nop

080484d0 <__libc_csu_init>:
 80484d0:	55                   	push   %ebp
 80484d1:	57                   	push   %edi
 80484d2:	31 ff                	xor    %edi,%edi
 80484d4:	56                   	push   %esi
 80484d5:	53                   	push   %ebx
 80484d6:	e8 75 fe ff ff       	call   8048350 <__x86.get_pc_thunk.bx>
 80484db:	81 c3 25 1b 00 00    	add    $0x1b25,%ebx
 80484e1:	83 ec 1c             	sub    $0x1c,%esp
 80484e4:	8b 6c 24 30          	mov    0x30(%esp),%ebp
 80484e8:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 80484ee:	e8 c1 fd ff ff       	call   80482b4 <_init>
 80484f3:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 80484f9:	29 c6                	sub    %eax,%esi
 80484fb:	c1 fe 02             	sar    $0x2,%esi
 80484fe:	85 f6                	test   %esi,%esi
 8048500:	74 27                	je     8048529 <__libc_csu_init+0x59>
 8048502:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048508:	8b 44 24 38          	mov    0x38(%esp),%eax
 804850c:	89 2c 24             	mov    %ebp,(%esp)
 804850f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048513:	8b 44 24 34          	mov    0x34(%esp),%eax
 8048517:	89 44 24 04          	mov    %eax,0x4(%esp)
 804851b:	ff 94 bb 08 ff ff ff 	call   *-0xf8(%ebx,%edi,4)
 8048522:	83 c7 01             	add    $0x1,%edi
 8048525:	39 f7                	cmp    %esi,%edi
 8048527:	75 df                	jne    8048508 <__libc_csu_init+0x38>
 8048529:	83 c4 1c             	add    $0x1c,%esp
 804852c:	5b                   	pop    %ebx
 804852d:	5e                   	pop    %esi
 804852e:	5f                   	pop    %edi
 804852f:	5d                   	pop    %ebp
 8048530:	c3                   	ret    
 8048531:	eb 0d                	jmp    8048540 <__libc_csu_fini>
 8048533:	90                   	nop
 8048534:	90                   	nop
 8048535:	90                   	nop
 8048536:	90                   	nop
 8048537:	90                   	nop
 8048538:	90                   	nop
 8048539:	90                   	nop
 804853a:	90                   	nop
 804853b:	90                   	nop
 804853c:	90                   	nop
 804853d:	90                   	nop
 804853e:	90                   	nop
 804853f:	90                   	nop

08048540 <__libc_csu_fini>:
 8048540:	f3 c3                	repz ret 

Disassembly of section .fini:

08048544 <_fini>:
 8048544:	53                   	push   %ebx
 8048545:	83 ec 08             	sub    $0x8,%esp
 8048548:	e8 03 fe ff ff       	call   8048350 <__x86.get_pc_thunk.bx>
 804854d:	81 c3 b3 1a 00 00    	add    $0x1ab3,%ebx
 8048553:	83 c4 08             	add    $0x8,%esp
 8048556:	5b                   	pop    %ebx
 8048557:	c3                   	ret    
