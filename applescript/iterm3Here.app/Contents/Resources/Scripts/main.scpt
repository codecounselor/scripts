FasdUAS 1.101.10   ��   ��    k             l      ��  ��    y s 

    Open Terminal Here 
     
    A toolbar script for Mac OS X 10.3/10.4
     
    Written by Brian Schlining
      � 	 	 �   
 
         O p e n   T e r m i n a l   H e r e   
           
         A   t o o l b a r   s c r i p t   f o r   M a c   O S   X   1 0 . 3 / 1 0 . 4 
           
         W r i t t e n   b y   B r i a n   S c h l i n i n g 
     
  
 l     ��������  ��  ��        l     ��������  ��  ��        j     �� �� 	0 debug    m     ��
�� boovfals      l     ��������  ��  ��        l     ��  ��    / ) when the toolbar script icon is clicked      �   R   w h e n   t h e   t o o l b a r   s c r i p t   i c o n   i s   c l i c k e d        l     ��  ��           �           i         I     ������
�� .aevtoappnull  �   � ****��  ��     O     ( ! " ! k    ' # #  $ % $ Q     & ' ( & r     ) * ) c     + , + l    -���� - l    .���� . n     / 0 / 1    ��
�� 
fvtg 0 l    1���� 1 4   �� 2
�� 
cwin 2 m   	 
���� ��  ��  ��  ��  ��  ��   , m    ��
�� 
alis * o      ���� 0 this_folder   ' R      ������
�� .ascrerr ****      � ****��  ��   ( r     3 4 3 1    ��
�� 
sdsk 4 o      ���� 0 this_folder   %  5 6 5 l   ��������  ��  ��   6  7 8 7 n   % 9 : 9 I     %�� ;���� 0 process_item   ;  <�� < o     !���� 0 this_folder  ��  ��   :  f      8  =�� = l  & &��������  ��  ��  ��   " m      > >�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��     ? @ ? l     ��������  ��  ��   @  A B A l     ��������  ��  ��   B  C D C l     �� E F��   E K E This handler processes folders dropped onto the toolbar script icon     F � G G �   T h i s   h a n d l e r   p r o c e s s e s   f o l d e r s   d r o p p e d   o n t o   t h e   t o o l b a r   s c r i p t   i c o n   D  H I H l     �� J K��   J       K � L L    I  M N M i    
 O P O I     �� Q��
�� .aevtodocnull  �    alis Q o      ���� 0 these_items  ��   P Y       R�� S T�� R k     U U  V W V r     X Y X n     Z [ Z 4    �� \
�� 
cobj \ o    ���� 0 i   [ o    ���� 0 these_items   Y o      ���� 0 	this_item   W  ]�� ] n    ^ _ ^ I    �� `���� 0 process_item   `  a�� a o    ���� 0 	this_item  ��  ��   _  f    ��  �� 0 i   S m    ����  T l   	 b���� b I   	�� c��
�� .corecnte****       **** c o    ���� 0 these_items  ��  ��  ��  ��   N  d e d l     ��������  ��  ��   e  f g f l     ��������  ��  ��   g  h i h l     �� j k��   j 6 0 this subroutine processes does the actual work     k � l l `   t h i s   s u b r o u t i n e   p r o c e s s e s   d o e s   t h e   a c t u a l   w o r k   i  m n m l     �� o p��   o P J this version can handle this weirdo case: a folder named "te'st"� te%s`t"    p � q q �   t h i s   v e r s i o n   c a n   h a n d l e   t h i s   w e i r d o   c a s e :   a   f o l d e r   n a m e d   " t e ' s t " �   t e % s ` t " n  r s r l     ��������  ��  ��   s  t u t i     v w v I      �� x���� 0 process_item   x  y�� y o      ���� 0 	this_item  ��  ��   w k     T z z  { | { l     ��������  ��  ��   |  } ~ } r       �  n      � � � 1    ��
�� 
strq � n      � � � 1    ��
�� 
psxp � o     ���� 0 	this_item   � o      ���� 0 thepath thePath ~  � � � r     � � � b     � � � b     � � � m    	 � � � � �  c d   � o   	 
���� 0 thepath thePath � m     � � � � �  ; c l e a r ; � o      ���� 0 thecmd theCmd �  � � � l   ��������  ��  ��   �  � � � O    R � � � k    Q � �  � � � I   ������
�� .miscactvnull��� ��� null��  ��   �  � � � l   �� � ���   � - ' just open a terminal and cd to thePath    � � � � N   j u s t   o p e n   a   t e r m i n a l   a n d   c d   t o   t h e P a t h �  � � � l   �� � ���   � ; 5set newWindow to (create window with default profile)    � � � � j s e t   n e w W i n d o w   t o   ( c r e a t e   w i n d o w   w i t h   d e f a u l t   p r o f i l e ) �  � � � l   ��������  ��  ��   �  � � � r     � � � 1    ��
�� 
Crwn � o      ���� 0 awindow aWindow �  � � � l     ��������  ��  ��   �  � � � Z     < � ��� � � =    # � � � o     !���� 0 awindow aWindow � m   ! "��
�� 
msng � r   & - � � � l  & + ����� � I  & +������
�� .Itrmnwwnnull��� ��� null��  ��  ��  ��   � o      ���� 0 awindow aWindow��   � O   0 < � � � r   4 ; � � � l  4 9 ����� � I  4 9������
�� .Itrmntwnnull���     obj ��  ��  ��  ��   � o      ���� 0 t   � o   0 1�� 0 awindow aWindow �  � � � l  = =�~�}�|�~  �}  �|   �  � � � l  = =�{�z�y�{  �z  �y   �  � � � O   = O � � � I  C N�x�w �
�x .Itrmsntxnull���     obj �w   � �v ��u
�v 
Text � b   E J � � � b   E H � � � m   E F � � � � �  c d   � o   F G�t�t 0 thepath thePath � m   H I � � � � �  ; c l e a r ;�u   � n   = @ � � � 1   > @�s
�s 
Wcsn � o   = >�r�r 0 awindow aWindow �  ��q � l  P P�p�o�n�p  �o  �n  �q   � m     � �|                                                                                  ITRM  alis      Macintosh HD                   BD ����	iTerm.app                                                      ����            ����  
 cu             Applications  /:Applications:iTerm.app/    	 i T e r m . a p p    M a c i n t o s h   H D  Applications/iTerm.app  / ��   �  � � � l  S S�m�l�k�m  �l  �k   �  ��j � l  S S�i�h�g�i  �h  �g  �j   u  ��f � l     �e�d�c�e  �d  �c  �f       
�b ��a � � � ��`�_�^�b   � �]�\�[�Z�Y�X�W�V�] 	0 debug  
�\ .aevtoappnull  �   � ****
�[ .aevtodocnull  �    alis�Z 0 process_item  �Y 0 this_folder  �X  �W  �V  
�a boovfals � �U  �T�S � ��R
�U .aevtoappnull  �   � ****�T  �S   �   � 	 >�Q�P�O�N�M�L�K�J
�Q 
cwin
�P 
fvtg
�O 
alis�N 0 this_folder  �M  �L  
�K 
sdsk�J 0 process_item  �R )� % *�k/�,�&E�W X  *�,E�O)�k+ OPU � �I P�H�G � ��F
�I .aevtodocnull  �    alis�H 0 these_items  �G   � �E�D�C�E 0 these_items  �D 0 i  �C 0 	this_item   � �B�A�@
�B .corecnte****       ****
�A 
cobj�@ 0 process_item  �F ! k�j  kh ��/E�O)�k+ [OY�� � �? w�>�= � ��<�? 0 process_item  �> �; ��;  �  �:�: 0 	this_item  �=   � �9�8�7�6�5�9 0 	this_item  �8 0 thepath thePath�7 0 thecmd theCmd�6 0 awindow aWindow�5 0 t   � �4�3 � � ��2�1�0�/�.�-�, � ��+
�4 
psxp
�3 
strq
�2 .miscactvnull��� ��� null
�1 
Crwn
�0 
msng
�/ .Itrmnwwnnull��� ��� null
�. .Itrmntwnnull���     obj 
�- 
Wcsn
�, 
Text
�+ .Itrmsntxnull���     obj �< U��,�,E�O�%�%E�O� ?*j O*�,E�O��  *j E�Y � 	*j 	E�UO��, *��%�%l UOPUOP ��alis    �  Macintosh HD                   BD ����Microsoft Remote Deskt#FFFFFFFF                                ����            ����  
 cu             Applications  2/:Applications:Microsoft Remote Desktop.localized/  F " M i c r o s o f t   R e m o t e   D e s k t o p . l o c a l i z e d    M a c i n t o s h   H D  /Applications/Microsoft Remote Desktop.localized   / ��  �`  �_  �^  ascr  ��ޭ